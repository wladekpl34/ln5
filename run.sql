-- @block
-- Get recipes based on preferred eating habits
SELECT 
    r.Name
FROM ERNÄHRUNGSKATEGORIE ek
LEFT JOIN ERNÄHRUNGSKATEGORIE_REZEPT ekr ON ek.ErnKtgID = ekr.ErnKtgID
LEFT JOIN REZEPT r ON r.RzptID = ekr.RzptID
WHERE ek.Bezeichnung = "Vegan";


-- @block
-- Get recipes based on a single ingeredient

SELECT 
r.Name

FROM ZUTAT z 
JOIN ZUTAT_REZEPT zr ON z.ZtID = zr.ZtID
JOIN REZEPT r ON r.RzptID = zr.RzptID

WHERE z.Bezeichnung = "Lachs"

-- @block
-- get all ingredients of a recipe

SELECT Z.Bezeichnung, ZR.Menge, ZR.Einheit
FROM REZEPT R
JOIN ZUTAT_REZEPT ZR ON R.RzptID = ZR.RzptID
JOIN ZUTAT Z ON ZR.ZtID = Z.ZtID
WHERE R.Name = 'Rezeptname';


-- @block
-- select all ingredients that are not used in a recipe

SELECT 
    z.Bezeichnung
FROM ZUTAT z
LEFT JOIN ZUTAT_REZEPT zr ON z.ZtID = zr.ZtID
WHERE zr.RzptID IS NULL

-- @block
-- Calculation of average nutritional value of orders for a specific customer (all o)

SELECT 
 AVG(z.KalorienProHundertGramm),
 AVG(z.FettProHundertGramm), 
 AVG(z.BallaststoffeProHundertGramm),
 AVG(z.NatriumProHundertGramm),
 AVG(z.KohlenhydrateProHundertGramm)
FROM BESTELLUNG b
JOIN KUNDE k ON b.KdID = k.KdID
JOIN BESTELLUNG_REZEPT br ON b.BestellID = br.BestellID
JOIN ZUTAT_REZEPT zr ON br.RzptID = zr.RzptID
JOIN ZUTAT z ON zr.ZtID = z.ZtID
WHERE k.Vorname = "Dorothea" AND k.Nachnamen = "Foede";

-- @block
-- select all recipes that contain under a specific calorie treshhold

SELECT 
  r.RzptID,
  r.Name,
  SUM(z.KalorienProHundertGramm * zr.Menge / 100) AS GesamtKalorien
FROM 
  REZEPT r
JOIN 
  ZUTAT_REZEPT zr ON r.RzptID = zr.RzptID
JOIN 
  ZUTAT z ON zr.ZtID = z.ZtID
GROUP BY 
  r.RzptID, r.Name
HAVING 
  GesamtKalorien <= 600;

-- @block
-- Select all recipies that contain less than 5 ingredients

SELECT R.RzptID, R.Name
FROM REZEPT R
JOIN ZUTAT_REZEPT ZR ON R.RzptID = ZR.RzptID
JOIN ERNÄHRUNGSKATEGORIE_REZEPT ER ON R.RzptID = ER.RzptID
JOIN ERNÄHRUNGSKATEGORIE EK ON ER.ErnKtgID = EK.ErnKtgID
GROUP BY R.RzptID, R.Name
HAVING COUNT(ZR.ZtID) < 5;

-- @block
-- Select all recipies that contain less than 5 ingredients and a specified eating choice

SELECT R.RzptID, R.Name
FROM REZEPT R
JOIN ZUTAT_REZEPT ZR ON R.RzptID = ZR.RzptID
JOIN ERNÄHRUNGSKATEGORIE_REZEPT ER ON R.RzptID = ER.RzptID
JOIN ERNÄHRUNGSKATEGORIE EK ON ER.ErnKtgID = EK.ErnKtgID
WHERE EK.Bezeichnung = 'Vegan'
GROUP BY R.RzptID, R.Name
HAVING COUNT(ZR.ZtID) < 5;

-- @block
-- select all ingredients that are allergen-free

SELECT Z.Bezeichnung
FROM ZUTAT Z
LEFT JOIN ZUTAT_ALLERGEN ZA ON Z.ZtID = ZA.ZtID
WHERE ZA.AlgID IS NULL;

-- @block Delete User Transaction

SET @user_id = id; 

DELETE FROM ADRESSE WHERE KdID = @user_id;

DELETE BR FROM BESTELLUNG_REZEPT BR
JOIN BESTELLUNG B ON BR.BestellID = B.BestellID
WHERE B.KdID = @user_id;

DELETE FROM BESTELLUNG WHERE KdID = @user_id;

DELETE FROM KUNDE WHERE KdID = @user_id;

-- @block Ansicht Kundendaten
SELECT 
  k.KdID, k.Vorname, k.Nachnamen, k.Geburtsdatum, k.Telefon, k.Email,
  a.PLZ, a.Stadt, a.Strasse, a.HausNr
FROM KUNDE k
LEFT JOIN ADRESSE a ON k.KdID = a.KdID
WHERE k.KdID = user_id;


SELECT 
  br.BestellID, r.Name AS Rezeptname, br.Menge
FROM BESTELLUNG b
JOIN BESTELLUNG_REZEPT br ON b.BestellID = br.BestellID
JOIN REZEPT r ON br.RzptID = r.RzptID
WHERE b.KdID = user_id;

