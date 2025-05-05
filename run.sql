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
-- Get recipes based on preferred eating habits
SELECT 
r.Name

FROM ERNÄHRUNGSKATEGORIE ek 

JOIN ERNÄHRUNGSKATEGORIE_REZEPT ekr ON ek.ErnKtgID = ekr.ErnKtgID

JOIN REZEPT r ON r.RzptID = ekr.RzptID

WHERE ek.Bezeichnung = "Fleisch"


-- @block
-- Get recipes based on a single ingeredient

SELECT 
r.Name

FROM ZUTAT z 
JOIN ZUTAT_REZEPT zr ON z.ZtID = zr.ZtID
JOIN REZEPT r ON r.RzptID = zr.RzptID

WHERE z.Bezeichnung = "Lachs"

-- @block
-- Calculation of average nutritional value of orders for a specific customer (all o)

SELECT AVG() FROM BESTELLUNG b
JOIN KUNDE k ON b.KdID = k.KdID
JOIN BESTELLUNG_REZEPT br ON b.BestellID = br.BestellID
JOIN ZUTAT_REZEPT zr ON br.RzptID = zr.RzptID
JOIN ZUTAT z ON zr.ZtID = z.ZtID
WHERE k.Name = "Kira";