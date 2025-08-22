USE [Bibliothek]
GO
CREATE PROCEDURE [dbo].[UeberfaelligeAusleihen]
    @TageFrist INT = 14   -- Standard: 14 Tage Leihfrist
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        l.AusleihID,
        m.Name AS Mitglied,
        b.Titel AS Buch,
        l.Ausleihdatum,
        DATEADD(DAY, @TageFrist, l.Ausleihdatum) AS Faelligkeitsdatum,
        DATEDIFF(DAY, DATEADD(DAY, @TageFrist, l.Ausleihdatum), GETDATE()) AS TageÜberfaellig
    FROM Loan l
    INNER JOIN Member m ON l.MitgliedsID = m.MitgliedsID
    INNER JOIN Book b ON l.BuchID = b.BuchID
    WHERE l.Rückgegeben = 0
      AND DATEADD(DAY, @TageFrist, l.Ausleihdatum) < GETDATE()
    ORDER BY TageÜberfaellig DESC;
END;
GO

