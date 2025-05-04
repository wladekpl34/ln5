-- Insert data for ALLERGEN table
INSERT INTO ALLERGEN (Bezeichnung) VALUES 
('Laktose'),
('Weizen'),
('Gluten'),
('Stärke'),
('Karotte');

-- Insert data for ERNÄHRUNGSKATEGORIE table
INSERT INTO ERNÄHRUNGSKATEGORIE (Bezeichnung) VALUES 
('Vegetarisch'),
('Vegan'),
('Fisch'),
('Fleisch'),
('Laktosefrei'),
('Glutenfrei');

-- Insert data for LIEFERANT table
INSERT INTO LIEFERANT (Name) VALUES 
('Gemüsegroßhandel Frisch & Co'),
('Fleischerei Müller'),
('Bio-Hof Schmidt'),
('Molkerei Alpenglück'),
('Fischgroßhandel Meeresbrise');

-- Insert data for ZUTAT table
INSERT INTO ZUTAT (Bezeichnung, Bestand, FettProHundertGramm, BallaststoffeProHundertGramm, NatriumProHundertGramm, Co2Bilanz, KalorienProHundertGramm, Nettopreis, KohlenhydrateProHundertGramm, Einheit, LfID) VALUES 
-- Milchreis-Zutaten
('Vollmilch', 500, 3.50, 0.00, 0.05, 1.30, 65, 1.25, 4.80, 'Liter', 4),
('Milchreis', 300, 0.50, 1.30, 0.01, 0.80, 350, 1.99, 78.00, 'kg', 3),
('Zucker', 800, 0.00, 0.00, 0.00, 0.60, 400, 0.89, 100.00, 'kg', 3),
('Butter', 400, 82.00, 0.00, 0.10, 7.30, 741, 2.49, 0.60, 'kg', 4),
('Vanillezucker', 150, 0.00, 0.00, 0.00, 0.60, 390, 0.39, 95.00, 'Päckchen', 3),
('Apfelmus', 200, 0.20, 2.00, 0.01, 0.90, 83, 1.29, 20.00, 'Glas', 3),

-- Couscous-Salat-Zutaten
('Couscous', 250, 1.40, 5.00, 0.01, 0.70, 365, 1.79, 75.00, 'kg', 3),
('Gemüsebrühe', 180, 0.50, 0.00, 0.70, 0.30, 15, 2.49, 3.00, 'Liter', 3),
('Tomaten', 350, 0.20, 1.50, 0.01, 0.40, 18, 2.99, 3.90, 'kg', 1),
('Zucchini', 280, 0.30, 1.00, 0.00, 0.30, 17, 2.29, 3.10, 'kg', 1),
('Paprika gelb', 150, 0.20, 2.00, 0.00, 0.40, 27, 3.99, 6.40, 'kg', 1),
('Kräuter gemischt', 100, 0.50, 3.00, 0.02, 0.20, 35, 1.99, 5.00, 'Bund', 3),
('Pflanzenöl', 400, 100.00, 0.00, 0.00, 3.10, 900, 2.49, 0.00, 'Liter', 3),
('Salz', 1000, 0.00, 0.00, 39.00, 0.10, 0, 0.49, 0.00, 'kg', 3),
('Pfeffer', 500, 3.30, 25.00, 0.04, 0.20, 255, 1.99, 64.00, 'kg', 3),

-- Lachslasagne-Zutaten
('Lasagneplatten', 180, 1.50, 3.00, 0.02, 0.90, 350, 1.29, 71.00, 'kg', 3),
('Spinat', 200, 0.40, 2.20, 0.07, 0.30, 23, 1.89, 3.60, 'kg', 1),
('Lachs', 150, 13.00, 0.00, 0.05, 5.20, 208, 19.99, 0.00, 'kg', 5),
('Käse gerieben', 200, 25.00, 0.00, 0.70, 8.40, 350, 3.99, 1.00, 'kg', 4),
('Mehl', 500, 1.00, 3.50, 0.00, 0.70, 348, 0.79, 72.00, 'kg', 3),
('Sahne', 300, 30.00, 0.00, 0.04, 2.70, 204, 1.49, 3.00, 'Liter', 4),
('Parmesan', 120, 29.00, 0.00, 1.60, 8.50, 431, 4.99, 0.00, 'kg', 4),
('Zitrone', 180, 0.20, 2.80, 0.00, 0.30, 29, 0.49, 9.00, 'Stück', 1),
('Muskat', 100, 36.00, 21.00, 0.03, 0.70, 525, 1.29, 49.00, 'Packung', 3),

-- Thaicurry-Zutaten
('Hähnchenbrustfilet', 200, 3.60, 0.00, 0.09, 4.20, 165, 7.99, 0.00, 'kg', 2),
('Reis', 300, 0.70, 1.30, 0.00, 2.70, 350, 1.99, 78.00, 'kg', 3),
('Sojasauce', 250, 0.10, 0.00, 5.70, 0.80, 53, 2.49, 8.00, 'Flasche', 3),
('Knoblauchzehe', 150, 0.50, 1.70, 0.02, 0.20, 149, 0.99, 33.00, 'kg', 1),
('Gemischtes Gemüse', 200, 0.30, 3.00, 0.02, 0.40, 25, 3.99, 5.00, 'kg', 1),
('Bambussprossen', 100, 0.30, 2.20, 0.01, 0.60, 19, 1.79, 3.00, 'Glas', 3),
('Kokosmilch', 180, 17.00, 0.00, 0.03, 0.90, 230, 1.99, 5.50, 'Dose', 3),
('Currypaste grün', 90, 4.00, 1.20, 1.80, 0.50, 115, 2.49, 15.00, 'Glas', 3),

-- Kartoffelsuppe-Zutaten
('Kartoffeln', 500, 0.10, 2.00, 0.01, 0.20, 77, 1.99, 17.00, 'kg', 1),
('Karotte', 300, 0.20, 3.00, 0.06, 0.10, 41, 1.49, 10.00, 'kg', 1),
('Lauch', 150, 0.30, 2.10, 0.05, 0.20, 29, 2.29, 6.00, 'kg', 1),
('Zwiebel', 200, 0.10, 1.70, 0.01, 0.10, 40, 0.99, 9.00, 'kg', 1),
('Wiener Würstchen', 100, 25.00, 0.00, 0.80, 7.20, 280, 3.99, 2.00, 'Paar', 2),
('Tofuwürstchen', 80, 8.00, 4.00, 0.40, 1.20, 160, 2.99, 10.00, 'Paar', 3),
('Petersilie', 120, 0.40, 3.30, 0.05, 0.10, 36, 0.99, 6.30, 'Bund', 1),
('Schnittlauch', 100, 0.70, 2.50, 0.03, 0.10, 30, 0.99, 4.50, 'Bund', 1),
('Majoran', 90, 7.00, 40.00, 0.05, 0.20, 271, 1.29, 61.00, 'Packung', 3);

-- Insert data for ZUTAT_ALLERGEN table
INSERT INTO ZUTAT_ALLERGEN (ZtID, AlgID) VALUES 
(1, 1),  -- Vollmilch enthält Laktose
(4, 1),  -- Butter enthält Laktose
(16, 2), -- Lasagneplatten enthalten Weizen
(16, 3), -- Lasagneplatten enthalten Gluten
(19, 1), -- Käse gerieben enthält Laktose
(20, 2), -- Mehl enthält Weizen
(20, 3), -- Mehl enthält Gluten
(21, 1), -- Sahne enthält Laktose
(22, 1), -- Parmesan enthält Laktose
(26, 3), -- Reis könnte Gluten-Spuren enthalten
(34, 4), -- Kartoffeln enthalten Stärke
(35, 5); -- Karotte enthält... naja, Karotte

-- Insert data fobr REZEPT table
INSERT INTO REZEPT (Name, Anleitung) VALUES 
-- Milchreis mit Apfelmus
('Milchreis mit Apfelmus', 'In einem großen Topf die Butter schmelzen, anschließend den Rundkornreis kurz in der Butter anschwitzen. Nun die zimmerwarme Vollmilch sowie 4 EL Zucker hinzugeben. Vanillezucker hinzugeben. Alles unter vorsichtigem Rühren mit dem Holzkochlöffel einmal aufkochen lassen und dabei aufpassen, dass sich nichts am Topfboden ansetzt.

Nun den Topf auf eine Herdplatte stellen, die auf kleinster Stufe heizt. Den Milchreis im geschlossenen Topf exakt 30 Minuten ziehen lassen. Nach der Hälfte der Zeit einmal umrühren.

Nach 30 Minuten ist der Milchreis servierfertig, er kann warm oder kalt gegessen werden.

Nach Geschmack Apfelmus dazu reichen.'),

-- Sommerlicher Couscous-Salat
('Sommerlicher Couscous-Salat', 'Couscous in eine Schale geben und mit kochender Gemüsebrühe übergießen. Kurz umrühren, quellen lassen und evtl. Wasser nachgeben.

Inzwischen das Gemüse waschen und anschließend würfeln. Die Kräuter waschen und kleinhacken. Diese Zutaten mit dem Couscous vermischen. Nun Öl hinzugeben und zum Schluss mit Salz und Pfeffer abschmecken.'),

-- Lachslasagne
('Lachslasagne', 'Den Spinat 5 min vorgaren, auspressen bis er ganz trocken ist und würzen.
Den Lachs etwas auftauen lassen, in kleine Stücke schneiden und mit Zitrone, Salz und Pfeffer würzen.

Für die Bechamel-Soße wird die Butter im Topf erhitzt, das Mehl verrührt und mit der Milch aufgegossen. Die Brühe dazugeben und 5 min. kochen lassen. Danach die Sahne dazurühren und nochmals aufkochen lassen.

Schließlich den Parmesan hinzufügen und mit Pfeffer und Muskat abschmecken. Jetzt alles abwechselnd in eine feuerfeste Form schichten, zuerst die Soße, dann Lasagneblätter, Soße, Spinat, Lachs, Käse, Lasagneblätter, usw. Letzte Schicht ist Soße.

Die Lasagne anschließend bei 200 Grad 45 min. in den Backofen.'),

-- Thaicurry mit Hähnchen
('Thaicurry mit Hähnchen', 'Die Hühnerbrust in Streifen schneiden und in einer Marinade aus Sojasauce, Pfeffer und Zucker ca. 1 Stunde marinieren.
Im Wok oder in der Pfanne gut anbraten. Herausnehmen.

Gemischtes Gemüse und Bambussprossen waschen und sehr fein schneiden, ebenfalls anbraten, dann herausnehmen.

Die Currypaste und die Kokosmilch im Wok verrühren und kurz (!) durchköcheln lassen. Dann Fleisch und Gemüse wieder zugeben und noch kurz köcheln lassen.
Mit Sojasauce abschmecken.

In der Zwischenzeit den Reis kochen und abtropfen lassen.'),

-- Kartoffelsuppe
('Kartoffelsuppe', 'Kartoffeln und Karotte schälen und in grobe Würfel schneiden. Zwiebel würfeln. Lauch in Ringe schneiden.

Zwiebeln in etwas Olivenöl glasig dünsten, Lauch dazugeben. Mit der Gemüsebrühe ablöschen.

Die gewürfelten Kartoffeln und Karotte in die Brühe geben. Alles für ca. 20 min köcheln lassen.

Anschließend alles mit dem Pürierstab zu einer Suppe pürieren, mit Pfeffer und Muskat abschmecken.

Die in Scheiben geschnittenen Würstchen in den Suppenteller geben und die heiße Kartoffelsuppe darüber gießen.');

-- Insert data for ZUTAT_REZEPT table
INSERT INTO ZUTAT_REZEPT (ZtID, RzptID, Menge, Einheit) VALUES 
-- Milchreis mit Apfelmus
(1, 1, 1, 'Liter'),      -- Vollmilch
(2, 1, 250, 'g'),        -- Milchreis
(3, 1, 4, 'EL'),         -- Zucker
(4, 1, 1, 'EL'),         -- Butter
(5, 1, 1, 'Päckchen'),   -- Vanillezucker
(6, 1, 1, 'Glas'),       -- Apfelmus

-- Sommerlicher Couscous-Salat
(7, 2, 200, 'g'),        -- Couscous
(8, 2, 300, 'ml'),       -- Gemüsebrühe
(9, 2, 3, 'Stück'),      -- Tomaten
(10, 2, 1, 'Stück'),     -- Zucchini
(11, 2, 1, 'Stück'),     -- Paprika gelb
(12, 2, 3, 'EL'),        -- Kräuter gemischt
(13, 2, 2, 'EL'),        -- Pflanzenöl
(14, 2, 1, 'Prise'),     -- Salz
(15, 2, 1, 'Prise'),     -- Pfeffer

-- Lachslasagne
(16, 3, 300, 'g'),       -- Lasagneplatten
(17, 3, 800, 'g'),       -- Spinat
(18, 3, 500, 'g'),       -- Lachs
(19, 3, 150, 'g'),       -- Käse gerieben
(4, 3, 50, 'g'),         -- Butter
(20, 3, 2, 'EL'),        -- Mehl
(1, 3, 250, 'ml'),       -- Vollmilch
(8, 3, 125, 'ml'),       -- Gemüsebrühe
(21, 3, 200, 'g'),       -- Sahne
(22, 3, 75, 'g'),        -- Parmesan
(23, 3, 1, 'Stück'),     -- Zitrone
(15, 3, 1, 'Prise'),     -- Pfeffer
(24, 3, 1, 'Prise'),     -- Muskat

-- Thaicurry mit Hähnchen
(25, 4, 500, 'g'),       -- Hähnchenbrustfilet
(26, 4, 250, 'g'),       -- Reis
(27, 4, 2, 'EL'),        -- Sojasauce
(3, 4, 1, 'EL'),         -- Zucker
(28, 4, 1, 'Zehe'),      -- Knoblauchzehe
(29, 4, 800, 'g'),       -- Gemischtes Gemüse
(30, 4, 1, 'Glas'),      -- Bambussprossen
(31, 4, 125, 'ml'),      -- Kokosmilch
(32, 4, 1, 'EL'),        -- Currypaste grün
(15, 4, 1, 'Prise'),     -- Pfeffer

-- Kartoffelsuppe
(33, 5, 5, 'Stück'),     -- Kartoffeln
(34, 5, 1, 'Stück'),     -- Karotte
(35, 5, 1, 'Stange'),    -- Lauch
(36, 5, 1, 'Stück'),     -- Zwiebel
(8, 5, 1000, 'ml'),      -- Gemüsebrühe
(37, 5, 2, 'Stück'),     -- Wiener Würstchen
(39, 5, 1, 'Bund'),      -- Petersilie
(15, 5, 1, 'Prise'),     -- Pfeffer
(40, 5, 1, 'Bund'),      -- Schnittlauch
(41, 5, 1, 'Prise'),     -- Majoran
(24, 5, 1, 'Prise');     -- Muskat

-- Insert data for ERNÄHRUNGSKATEGORIE_REZEPT table
INSERT INTO ERNÄHRUNGSKATEGORIE_REZEPT (ErnKtgID, RzptID) VALUES 
(1, 1), -- Milchreis mit Apfelmus ist vegetarisch
(1, 2), -- Couscous-Salat ist vegetarisch
(2, 2), -- Couscous-Salat ist vegan
(3, 3), -- Lachslasagne enthält Fisch
(4, 4), -- Thaicurry mit Hähnchen enthält Fleisch
(1, 5), -- Kartoffelsuppe kann vegetarisch sein (mit Tofuwürstchen)
(4, 5); -- Kartoffelsuppe kann Fleisch enthalten (mit Wiener Würstchen)

-- Insert sample data for KUNDE table
INSERT INTO KUNDE (Vorname, Nachnamen, Geburtsdatum, Telefon, Email) VALUES 
('Max', 'Mustermann', '1985-03-15', '0123456789', 'max.mustermann@example.com'),
('Anna', 'Schmidt', '1990-07-22', '0987654321', 'anna.schmidt@example.com'),
('Peter', 'Meyer', '1978-11-05', '0123987456', 'peter.meyer@example.com'),
('Laura', 'Müller', '1995-02-28', '0456789123', 'laura.mueller@example.com'),
('Thomas', 'Becker', '1982-09-10', '0789123456', 'thomas.becker@example.com');

-- Insert data for ADRESSE table (for Kunden)
INSERT INTO ADRESSE (PLZ, Stadt, Strasse, HausNr, KdID, LfID) VALUES 
(10115, 'Berlin', 'Hauptstraße', 1, 1, NULL),
(20095, 'Hamburg', 'Hafenstraße', 23, 2, NULL),
(80331, 'München', 'Marienplatz', 8, 3, NULL),
(50667, 'Köln', 'Domstraße', 15, 4, NULL),
(60311, 'Frankfurt', 'Goethestraße', 42, 5, NULL);

-- Insert data for ADRESSE table (for Lieferanten)
INSERT INTO ADRESSE (PLZ, Stadt, Strasse, HausNr, KdID, LfID) VALUES 
(12347, 'Berlin', 'Industriestraße', 78, NULL, 1),
(22527, 'Hamburg', 'Schlachthofstraße', 12, NULL, 2),
(81379, 'München', 'Biohofweg', 5, NULL, 3),
(83661, 'Lenggries', 'Alpenweg', 29, NULL, 4),
(20457, 'Hamburg', 'Hafenpromenade', 103, NULL, 5);

-- Insert data for BESTELLUNG table
INSERT INTO BESTELLUNG (Gesamtpreis, Bestelldatum, KdID) VALUES 
(29.95, '2025-01-15', 1),
(42.50, '2025-01-20', 2),
(18.75, '2025-02-05', 3),
(35.20, '2025-02-10', 4),
(27.80, '2025-02-15', 5),
(31.45, '2025-03-01', 1),
(22.90, '2025-03-10', 3),
(45.60, '2025-04-05', 2),
(19.95, '2025-04-20', 4),
(33.25, '2025-05-01', 5);

-- Insert data for BESTELLUNG_REZEPT table
INSERT INTO BESTELLUNG_REZEPT (BestellID, RzptID, Menge) VALUES 
(1, 1, 2), -- 2x Milchreis für Bestellung 1
(1, 5, 1), -- 1x Kartoffelsuppe für Bestellung 1
(2, 3, 2), -- 2x Lachslasagne für Bestellung 2
(2, 4, 1), -- 1x Thaicurry für Bestellung 2
(3, 2, 3), -- 3x Couscous-Salat für Bestellung 3
(4, 4, 2), -- 2x Thaicurry für Bestellung 4
(4, 5, 1), -- 1x Kartoffelsuppe für Bestellung 4
(5, 1, 1), -- 1x Milchreis für Bestellung 5
(5, 2, 1), -- 1x Couscous-Salat für Bestellung 5
(5, 3, 1), -- 1x Lachslasagne für Bestellung 5
(6, 3, 2), -- 2x Lachslasagne für Bestellung 6
(7, 2, 2), -- 2x Couscous-Salat für Bestellung 7
(7, 5, 1), -- 1x Kartoffelsuppe für Bestellung 7
(8, 4, 3), -- 3x Thaicurry für Bestellung 8
(9, 1, 2), -- 2x Milchreis für Bestellung 9
(9, 5, 1), -- 1x Kartoffelsuppe für Bestellung 9
(10, 3, 1), -- 1x Lachslasagne für Bestellung 10
(10, 4, 1), -- 1x Thaicurry für Bestellung 10
(10, 5, 1); -- 1x Kartoffelsuppe für Bestellung 10