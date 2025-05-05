-- @block Kunden ansicht
SELECT * FROM KUNDE;

-- @block 
SELECT * FROM REZEPT;

-- @block 
SELECT * FROM BESTELLUNG;

-- @block
SELECT * FROM ALLERGEN;

-- @block
SELECT * FROM ZUTAT WHERE ZtID = 4;

-- @block
SELECT * FROM ALLERGEN;

-- @block
SELECT * FROM ZUTAT_ALLERGEN;

-- @block
SELECT * FROM ZUTAT_REZEPT;

-- @block
SELECT * FROM ERNÄHRUNGSKATEGORIE;

-- @block
SELECT * FROM ERNÄHRUNGSKATEGORIE_REZEPT;

-- @block

SELECT 
r.Name

FROM ernährungskategorie ek 

JOIN ERNÄHRUNGSKATEGORIE_REZEPT ekr ON ek.ErnKtgID = ekr.ErnKtgID

JOIN REZEPT r ON r.RzptID = ekr.RzptID

WHERE ek.Bezeichnung = "Fleisch"