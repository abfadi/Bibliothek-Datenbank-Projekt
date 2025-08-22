USE [Bibliothek]
GO

CREATE PROCEDURE [dbo].[Ausleihen]
    @BuchID INT,
    @MitgliedsID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Prüfen, ob das Buch verfügbar ist
    IF EXISTS (SELECT 1 FROM Book WHERE BuchID = @BuchID AND Verfuegbar = 1)
    BEGIN
        -- Buch ausleihen
        INSERT INTO Loan (BuchID, MitgliedsID, Ausleihdatum, Rückgabedatum, Rückgegeben)
        VALUES (@BuchID, @MitgliedsID, GETDATE(), NULL, 0);

        -- Buch als nicht verfügbar markieren
        UPDATE Book
        SET Verfuegbar = 0
        WHERE BuchID = @BuchID;

        PRINT 'Buch erfolgreich ausgeliehen.';
    END
    ELSE
    BEGIN
        PRINT 'Buch ist nicht verfügbar.';
    END
END;
GO

