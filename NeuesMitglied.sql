USE [Bibliothek]
GO
CREATE PROCEDURE [dbo].[NeuesMitglied]
    @Name VARCHAR(50),
    @Adresse VARCHAR(50),
    @Telefon VARCHAR(50),
    @Email VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Member (Name, Adresse, Telefon, Email)
    VALUES (@Name, @Adresse, @Telefon, @Email);

    PRINT 'Neues Mitglied erfolgreich hinzugefügt.';
END;
GO

