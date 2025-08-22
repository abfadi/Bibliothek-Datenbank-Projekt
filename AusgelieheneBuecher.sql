USE [Bibliothek]
GO

CREATE PROCEDURE [dbo].[AusgelieheneBuecher]
    @MitgliedsID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        l.AusleihID,
        b.Titel,
        b.Autor,
        l.Ausleihdatum,
        l.Rückgabedatum,
        CASE 
            WHEN l.Rückgegeben = 0 THEN 'Noch ausgeliehen'
            ELSE 'Zurückgegeben'
        END AS Status
    FROM Loan l
    INNER JOIN Book b ON l.BuchID = b.BuchID
    WHERE l.MitgliedsID = @MitgliedsID
    ORDER BY l.Ausleihdatum DESC;
END;
GO

