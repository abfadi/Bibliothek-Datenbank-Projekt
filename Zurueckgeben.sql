USE [Bibliothek]
GO
CREATE PROCEDURE [dbo].[Zurueckgeben]
    @BuchID INT,
    @MitgliedsID INT
AS
BEGIN
    SET NOCOUNT ON;

    -- Prüfen, ob das Buch ausgeliehen ist
    IF EXISTS (
        SELECT 1 FROM Loan
        WHERE BuchID = @BuchID
          AND MitgliedsID = @MitgliedsID
          AND Rückgegeben = 0
    )
    BEGIN
        -- Loan-Eintrag aktualisieren
        UPDATE Loan
        SET Rückgabedatum = GETDATE(),
            Rückgegeben = 1
        WHERE BuchID = @BuchID
          AND MitgliedsID = @MitgliedsID
          AND Rückgegeben = 0;

        -- Buch als verfügbar markieren
        UPDATE Book
        SET Verfuegbar = 1
        WHERE BuchID = @BuchID;

        PRINT 'Buch erfolgreich zurückgegeben.';
    END
    ELSE
    BEGIN
        PRINT 'Kein aktives Ausleihdatum gefunden.';
    END
END;
GO