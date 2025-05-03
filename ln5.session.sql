-- Reset and Seed Database Script
-- Drops all tables, recreates schema, and fully seeds test data with exact recipe details

-- 1) Disable foreign key checks
SET FOREIGN_KEY_CHECKS = 0;

-- 2) Drop tables in dependency order
DROP TABLE IF EXISTS ZUTAT_ALLERGEN;
DROP TABLE IF EXISTS ZUTAT_REZEPT;
DROP TABLE IF EXISTS BESTELLUNG_REZEPT;
DROP TABLE IF EXISTS ERNÄHRUNGSKATEGORIE_REZEPT;
DROP TABLE IF EXISTS ADRESSE;
DROP TABLE IF EXISTS BESTELLUNG;
DROP TABLE IF EXISTS ERNÄHRUNGSKATEGORIE;
DROP TABLE IF EXISTS REZEPT;
DROP TABLE IF EXISTS ALLERGEN;
DROP TABLE IF EXISTS ZUTAT;
DROP TABLE IF EXISTS LIEFERANT;
DROP TABLE IF EXISTS KUNDE;

-- 3) Create schema
CREATE TABLE KUNDE (
  KdID INT PRIMARY KEY AUTO_INCREMENT,
  Vorname VARCHAR(100) NOT NULL,
  Nachnamen VARCHAR(100) NOT NULL,
  Geburtsdatum DATE,
  Telefon VARCHAR(20),
  Email VARCHAR(100) NOT NULL
);

CREATE TABLE BESTELLUNG (
  BestellID INT PRIMARY KEY AUTO_INCREMENT,
  Gesamtpreis DECIMAL(10,2),
  Bestelldatum DATE,
  KdID INT,
  FOREIGN KEY (KdID) REFERENCES KUNDE(KdID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE LIEFERANT (
  LfID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100)
);

CREATE TABLE ADRESSE (
  AdresseID INT PRIMARY KEY AUTO_INCREMENT,
  PLZ INT NOT NULL,
  Stadt VARCHAR(100) NOT NULL,
  Strasse VARCHAR(100) NOT NULL,
  HausNr INT NOT NULL,
  KdID INT,
  LfID INT,
  FOREIGN KEY (KdID) REFERENCES KUNDE(KdID) ON DELETE RESTRICT ON UPDATE CASCADE,
  FOREIGN KEY (LfID) REFERENCES LIEFERANT(LfID) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE ZUTAT (
  ZtID INT PRIMARY KEY AUTO_INCREMENT,
  Bezeichnung VARCHAR(100),
  Bestand INT,
  FettProHundertGramm DECIMAL(5,2),
  BallaststoffeProHundertGramm DECIMAL(5,2),
  NatriumProHundertGramm DECIMAL(5,2),
  Co2Bilanz DECIMAL(5,2),
  KalorienProHundertGramm INT,
  Nettopreis DECIMAL(10,2),
  KohlenhydrateProHundertGramm DECIMAL(5,2),
  Einheit VARCHAR(100)
);

CREATE TABLE ALLERGEN (
  AlgID INT PRIMARY KEY AUTO_INCREMENT,
  Bezeichnung VARCHAR(100)
);

CREATE TABLE ZUTAT_ALLERGEN (
  AlgID INT,
  ZtID INT,
  PRIMARY KEY (ZtID,AlgID),
  FOREIGN KEY (AlgID) REFERENCES ALLERGEN(AlgID) ON DELETE CASCADE,
  FOREIGN KEY (ZtID) REFERENCES ZUTAT(ZtID) ON DELETE CASCADE
);

CREATE TABLE REZEPT (
  RzptID INT PRIMARY KEY AUTO_INCREMENT,
  Name VARCHAR(100),
  Anleitung TEXT
);

CREATE TABLE BESTELLUNG_REZEPT (
  BestellID INT,
  RzptID INT,
  Menge INT,
  PRIMARY KEY (BestellID,RzptID),
  FOREIGN KEY (BestellID) REFERENCES BESTELLUNG(BestellID) ON DELETE CASCADE,
  FOREIGN KEY (RzptID) REFERENCES REZEPT(RzptID) ON DELETE CASCADE
);

CREATE TABLE ZUTAT_REZEPT (
  ZtID INT,
  RzptID INT,
  Menge INT,
  Einheit VARCHAR(100),
  PRIMARY KEY (ZtID,RzptID),
  FOREIGN KEY (ZtID) REFERENCES ZUTAT(ZtID) ON DELETE CASCADE,
  FOREIGN KEY (RzptID) REFERENCES REZEPT(RzptID) ON DELETE CASCADE
);

CREATE TABLE ERNÄHRUNGSKATEGORIE (
  ErnKtgID INT PRIMARY KEY AUTO_INCREMENT,
  Bezeichnung VARCHAR(100)
);

CREATE TABLE ERNÄHRUNGSKATEGORIE_REZEPT (
  ErnKtgID INT,
  RzptID INT,
  PRIMARY KEY (ErnKtgID,RzptID),
  FOREIGN KEY (ErnKtgID) REFERENCES ERNÄHRUNGSKATEGORIE(ErnKtgID) ON DELETE CASCADE,
  FOREIGN KEY (RzptID) REFERENCES REZEPT(RzptID) ON DELETE CASCADE
);

-- 4) Seed data
SET FOREIGN_KEY_CHECKS = 0;

-- 4.1 Customers
INSERT INTO KUNDE (Vorname,Nachnamen,Geburtsdatum,Telefon,Email) VALUES
('Anna','Müller','1985-04-12','0151-12345678','anna.mueller@example.com'),
('Boris','Schmidt','1979-11-23','0172-23456789','boris.schmidt@example.com'),
('Clara','Weber','1992-07-05','0160-34567890','clara.weber@example.com'),
('Daniel','Fischer','1988-02-19','0157-45678901','daniel.fischer@example.com'),
('Eva','Becker','1995-09-30','0170-56789012','eva.becker@example.com'),
('Felix','Hoffmann','1983-12-08','0159-67890123','felix.hoffmann@example.com'),
('Greta','Schneider','1990-06-15','0171-78901234','greta.schneider@example.com'),
('Hans','Klein','1975-03-02','0163-89012345','hans.klein@example.com'),
('Isabel','Wolf','1987-10-27','0155-90123456','isabel.wolf@example.com'),
('Jonas','Richter','1993-01-14','0173-01234567','jonas.richter@example.com');

-- 4.2 Addresses
INSERT INTO ADRESSE (PLZ,Stadt,Strasse,HausNr,KdID) VALUES
(10115,'Berlin','Torstr.',1,1),(20095,'Hamburg','Mönckebergstr.',2,2),
(50667,'Köln','Domstr.',3,3),(80331,'München','Marienplatz',4,4),
(40213,'Düsseldorf','Königsallee',5,5),(90402,'Nürnberg','Karolinenpl.',6,6),
(90403,'Nürnberg','Eilgutstr.',7,7),(01067,'Dresden','Altmarkt',8,8),
(99084,'Erfurt','Domstr.',9,9),(28195,'Bremen','Böttcherstr.',10,10);

-- 4.3 Recipes (with exact instruction text)
INSERT INTO REZEPT (Name,Anleitung) VALUES
('Lachslasagne','Den Spinat 5 min vorgaren, auspressen und würzen. Lachs auftauen, würzen. Bechamel: Butter erhitzen, Mehl einrühren, Milch und Brühe zugeben, 5 min kochen, Sahne zugeben, Parmesan einrühren, abschmecken. Abwechselnd Soße, Lasagneplatten, Spinat, Lachs, Käse schichten. 45 min bei 200°C backen.'),
('Thaicurry mit Hähnchen','Hähnchen in Streifen schneiden und 1 h in Sojasauce, Zucker, Pfeffer marinieren. Hähnchen anbraten, herausnehmen. Gemüse & Bambussprossen anbraten. Currypaste & Kokosmilch kurz köcheln, Fleisch & Gemüse zugeben. Mit Sojasauce abschmecken. Reis kochen.'),
('Kartoffelsuppe','Kartoffeln, Karotte würfeln; Zwiebel und Lauch glasig dünsten, Brühe zugeben, Gemüse 20 min köcheln, pürieren, Würstchen zu Scheiben schneiden, in Teller geben, Suppe darauf.'),
('Milchreis mit Apfelmus','Butter schmelzen, Reis anschwitzen, Milch & Zucker & Vanillezucker zugeben, aufkochen, 30 min bei niedriger Hitze ziehen lassen (halbe Zeit rühren). Mit Apfelmus servieren.'),
('Sommerlicher Couscous-Salat','Couscous mit kochender Brühe übergießen, quellen lassen. Tomaten, Zucchini, Paprika & Kräuter würfeln, untermischen, Öl, Salz & Pfeffer zufügen.');

-- 4.4 Allergens
INSERT INTO ALLERGEN (Bezeichnung) VALUES
('Laktose'),('Weizen'),('Gluten'),('Stärke'),('Karotte');

-- 4.5 Ingredients (including lemon, pepper, nutmeg, herbs, oil, salt)
INSERT INTO ZUTAT (Bezeichnung,Bestand,FettProHundertGramm,BallaststoffeProHundertGramm,NatriumProHundertGramm,Co2Bilanz,KalorienProHundertGramm,Nettopreis,KohlenhydrateProHundertGramm,Einheit) VALUES
('Lasagneplatten',100,1.5,2.0,0.05,2.0,350,1.20,70.0,'g'),
('Spinat',200,0.4,2.2,0.03,1.2,23,0.80,3.6,'g'),
('Lachs',150,6.0,0.0,0.04,5.0,206,5.00,0.0,'g'),
('Käse gerieben',150,29.0,0.0,0.02,2.5,431,2.00,3.2,'g'),
('Butter',50,81.0,0.0,0.02,3.0,717,0.50,0.1,'g'),
('Mehl',100,1.5,2.7,0.01,1.0,364,0.30,76.0,'g'),
('Milch',500,3.5,0.0,0.04,1.8,64,0.90,4.8,'ml'),
('Brühe',125,0.5,0.0,0.50,0.5,5,0.20,0.5,'ml'),
('Sahne',200,35.0,0.0,0.05,4.0,340,1.50,3.0,'ml'),
('Parmesan',75,29.0,0.0,0.02,2.5,431,2.00,3.2,'g'),
('Zitrone',50,0.2,0.0,0.00,0.3,29,0.30,9.3,'Stk'),
('Pfeffer',20,3.3,26.5,28.6,0.1,251,0.10,64.8,'g'),
('Muskat',10,36.3,20.8,9.3,0.2,525,0.50,49.0,'g'),
('Hähnchenbrust',100,1.5,0.0,0.07,6.0,110,2.50,0.0,'g'),
('Reis',250,0.5,1.3,0.01,1.1,130,0.40,28.0,'g'),
('Sojasauce',50,0.1,0.0,3.5,2.0,53,1.10,4.9,'ml'),
('Zucker',10,0.0,0.0,0.01,0.8,387,0.10,100.0,'g'),
('Knoblauch',5,0.5,2.1,0.02,0.5,149,0.20,33.1,'g'),
('Gemüsemix',300,0.8,3.2,0.02,1.5,50,1.00,6.0,'g'),
('Bambussprossen',70,0.2,1.0,0.01,0.7,27,1.20,5.2,'g'),
('Kokosmilch',125,24.0,0.0,0.02,5.5,230,1.80,6.0,'ml'),
('Currypaste grün',15,5.0,0.0,0.03,2.0,150,1.50,8.0,'g'),
('Kartoffeln',500,0.1,2.1,0.01,1.2,77,0.30,17.0,'g'),
('Karotte',100,0.2,2.8,0.06,0.9,41,0.25,10.0,'g'),
('Lauch',100,0.2,1.6,0.03,0.8,31,0.50,7.8,'g'),
('Wiener Würstchen',100,30.0,0.0,1.0,4.0,300,1.00,1.5,'g'),
('Vollmilch',1000,3.5,0.0,0.04,1.8,64,0.90,4.8,'ml'),
('Vanillezucker',5,0.0,0.0,0.01,0.8,400,0.20,100.0,'g'),
('Couscous',200,1.0,2.7,0.02,1.3,112,0.60,23.0,'g'),
('Tomate',3,0.2,1.2,0.01,0.8,18,0.30,3.9,'Stk'),
('Zucchini',1,0.3,1.1,0.02,0.9,17,0.40,3.1,'Stk'),
('Paprika',1,0.2,1.7,0.01,0.9,20,0.50,4.6,'Stk'),
('Kräuter',3,0.5,5.0,0.01,0.2,36,1.00,4.0,'EL'),
('Pflanzenöl',2,100.0,0.0,0.00,6.0,884,1.00,0.0,'EL'),
('Salz',5,0.0,0.0,38.8,0.0,0,0.05,0.0,'g');

-- 4.6 ZUTAT ↔ REZEPT
INSERT INTO ZUTAT_REZEPT (ZtID,RzptID,Menge,Einheit) VALUES
-- Lachslasagne RzptID=1
(1,1,300,'g'),(2,1,800,'g'),(3,1,500,'g'),(4,1,150,'g'),(5,1,50,'g'),
(6,1,2,'EL'),(7,1,250,'ml'),(8,1,125,'ml'),(9,1,200,'g'),(10,1,75,'g'),
(11,1,1,'Stk'),(12,1,1,'Prise'),(13,1,1,'Prise'),
-- Thaicurry RzptID=2
(14,2,500,'g'),(15,2,250,'g'),(16,2,2,'EL'),(17,2,1,'EL'),
(18,2,1,'Stk'),(19,2,800,'g'),(20,2,1,'Glas'),(21,2,125,'ml'),(22,2,1,'EL'),
-- Kartoffelsuppe RzptID=3
(23,3,5,'Stk'),(24,3,1,'Stk'),(25,3,1,'Stk'),(26,3,1000,'ml'),(27,3,2,'Stk'),
-- Milchreis RzptID=4
(28,4,1000,'ml'),(29,4,250,'g'),(30,4,4,'EL'),(31,4,1,'EL'),(32,4,1,'Glas'),
-- Couscous-Salat RzptID=5
(33,5,200,'g'),(34,5,300,'ml'),(35,5,3,'Stk'),(36,5,1,'Stk'),(37,5,1,'Stk'),
(38,5,3,'EL'),(39,5,2,'EL');

-- 4.7 ZUTAT ↔ ALLERGEN
INSERT INTO ZUTAT_ALLERGEN (AlgID,ZtID) VALUES
(1,6),(1,7),(1,8),(1,29),(1,31),(1,32),
(2,1),(3,1),(2,5),(4,23),(5,24);

-- 5) Re-enable foreign key checks
SET FOREIGN_KEY_CHECKS = 1;

-- @block

-- Procedures for Data Requests (Auskunft) and Deletion per DSGVO
-- File: RequestAndDeletionProcedures.sql

-- 1) View for full customer data (Auskunft)
CREATE OR REPLACE VIEW v_Kunde_Auskunft AS
SELECT
  k.KdID,
  k.Vorname,
  k.Nachnamen,
  k.Geburtsdatum,
  k.Telefon,
  k.Email,
  a.PLZ,
  a.Stadt,
  a.Strasse,
  a.HausNr,
  b.BestellID,
  b.Bestelldatum,
  b.Gesamtpreis
FROM KUNDE k
LEFT JOIN ADRESSE a ON k.KdID = a.KdID
LEFT JOIN BESTELLUNG b ON k.KdID = b.KdID;

-- Usage:
-- SELECT * FROM v_Kunde_Auskunft WHERE KdID = ?;


-- 2) Stored procedure to export all data for a customer
DELIMITER $$
CREATE PROCEDURE sp_RequestCustomerData(IN in_KdID INT)
BEGIN
  SELECT * FROM v_Kunde_Auskunft
  WHERE KdID = in_KdID;
END $$
DELIMITER ;

-- Usage:
-- CALL sp_RequestCustomerData(123);


-- 3) Stored procedure to pseudonymize (anonymize) a customer
DELIMITER $$
CREATE PROCEDURE sp_AnonymizeCustomer(IN in_KdID INT)
BEGIN
  UPDATE KUNDE
  SET
    Vorname   = CONCAT('gelöscht_', KdID),
    Nachnamen = NULL,
    Email     = NULL,
    Telefon   = NULL
  WHERE KdID = in_KdID;

  UPDATE ADRESSE
  SET
    PLZ    = NULL,
    Stadt  = NULL,
    Strasse= NULL,
    HausNr = NULL
  WHERE KdID = in_KdID;

  -- Mark orders as anonymized (optional)
  UPDATE BESTELLUNG
  SET Gesamtpreis = NULL
  WHERE KdID = in_KdID;
END $$
DELIMITER ;

-- Usage:
-- CALL sp_AnonymizeCustomer(123);


-- 4) Stored procedure to permanently delete a customer and related records
DELIMITER $$
CREATE PROCEDURE sp_DeleteCustomer(IN in_KdID INT)
BEGIN
  -- Delete addresses
  DELETE FROM ADRESSE WHERE KdID = in_KdID;

  -- Delete order items
  DELETE br FROM BESTELLUNG_REZEPT br
    JOIN BESTELLUNG b ON br.BestellID = b.BestellID
    WHERE b.KdID = in_KdID;

  -- Delete orders
  DELETE FROM BESTELLUNG WHERE KdID = in_KdID;

  -- Finally delete customer
  DELETE FROM KUNDE WHERE KdID = in_KdID;
END $$
DELIMITER ;

-- Usage:
-- CALL sp_DeleteCustomer(123);

