USE [Bibliothek]
GO
CREATE PROCEDURE [dbo].[NeuesBuch]
    @Titel VARCHAR(50),
    @Autor VARCHAR(50),
    @Erscheinungsjahr DATE,
    @Genre VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO Book (Titel, Autor, Erscheinungsjahr, Genre, Verfuegbar)
    VALUES (@Titel, @Autor, @Erscheinungsjahr, @Genre, 1);  -- neues Buch ist verfügbar

    PRINT 'Neues Buch erfolgreich hinzugefügt.';
END;
GO

