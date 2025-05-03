-- First create the view

-- Then create each procedure without DELIMITER statements
DROP PROCEDURE IF EXISTS sp_RequestCustomerData;
CREATE PROCEDURE sp_RequestCustomerData(IN in_KdID INT)
BEGIN
  SELECT * FROM v_Kunde_Auskunft WHERE KdID = in_KdID;
END;

DROP PROCEDURE IF EXISTS sp_AnonymizeCustomer;
CREATE PROCEDURE sp_AnonymizeCustomer(IN in_KdID INT)
BEGIN
  -- Anonymize personal data in KUNDE
  UPDATE KUNDE
    SET Vorname   = CONCAT('gelöscht_', KdID),
        Nachnamen = NULL,
        Email     = NULL,
        Telefon   = NULL
    WHERE KdID = in_KdID;

  -- Anonymize address
  UPDATE ADRESSE
    SET PLZ     = NULL,
        Stadt   = NULL,
        Strasse = NULL,
        HausNr  = NULL
    WHERE KdID = in_KdID;

  -- Optionally clear order details
  UPDATE BESTELLUNG
    SET Gesamtpreis = NULL
    WHERE KdID = in_KdID;
END;

DROP PROCEDURE IF EXISTS sp_DeleteCustomer;
CREATE PROCEDURE sp_DeleteCustomer(IN in_KdID INT)
BEGIN
  -- Delete address entries
  DELETE FROM ADRESSE WHERE KdID = in_KdID;

  -- Delete order–recipe mappings using subquery (more compatible)
  DELETE FROM BESTELLUNG_REZEPT 
  WHERE BestellID IN (
    SELECT BestellID FROM BESTELLUNG WHERE KdID = in_KdID
  );

  -- Delete orders
  DELETE FROM BESTELLUNG WHERE KdID = in_KdID;

  -- Finally delete customer
  DELETE FROM KUNDE WHERE KdID = in_KdID;
END;
