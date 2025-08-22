# Bücherei-Verwaltungssystem

Ein einfaches Datenbankprojekt zur Verwaltung einer kleinen Bücherei. Das System verwaltet Bücher, Mitglieder und die Ausleihe von Büchern.

## Features

- **Bücherverwaltung**: Erfasse und verwalte Bücher mit Titel, Autor, Erscheinungsjahr, Genre und Verfügbarkeit.
- **Mitgliederverwaltung**: Lege Mitglieder mit Kontaktdaten an.
- **Ausleihverwaltung**: Verwalte, welche Bücher von welchen Mitgliedern ausgeliehen wurden und wann sie zurückgegeben werden müssen.
- **Übersicht**: Zeige ausgeliehene und verfügbare Bücher sowie überfällige Ausleihen an.

## Datenbankstruktur

**Tabelle: Bücher**
- BuchID (Primary Key)
- Titel
- Autor
- Erscheinungsjahr
- Genre
- Verfügbarkeit

**Tabelle: Mitglieder**
- MitgliedsID (Primary Key)
- Name
- Adresse
- Telefon
- E-Mail

**Tabelle: Ausleihen**
- AusleihID (Primary Key)
- BuchID (Foreign Key)
- MitgliedsID (Foreign Key)
- Ausleihdatum
- Rückgabedatum
- Rückgegeben (Ja/Nein)

## Erste Schritte`

**Projekt starten**
   - Je nach Implementierung (z.B. Python, PHP, etc.) siehe weitere Hinweise in diesem README.

## Beispiel-SQL-Schema

```sql
CREATE TABLE [dbo].[Book](
	[BuchID] [int] IDENTITY(1,1) NOT NULL,
	[Titel] [varchar](50) NULL,
	[Autor] [varchar](50) NULL,
	[Erscheinungsjahr] [date] NULL,
	[Genre] [varchar](50) NULL,
	[Verfuegbar] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BuchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Member](
	[MitgliedsID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Adresse] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MitgliedsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Loan](
	[AusleihID] [int] IDENTITY(1,1) NOT NULL,
	[BuchID] [int] NULL,
	[MitgliedsID] [int] NULL,
	[Ausleihdatum] [date] NULL,
	[Rückgabedatum] [date] NULL,
	[Rückgegeben] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AusleihID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Buch] FOREIGN KEY([BuchID])
REFERENCES [dbo].[Book] ([BuchID])
GO

ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Buch]
GO

ALTER TABLE [dbo].[Loan]  WITH CHECK ADD  CONSTRAINT [FK_Loan_Mitglied] FOREIGN KEY([MitgliedsID])
REFERENCES [dbo].[Member] ([MitgliedsID])
GO

ALTER TABLE [dbo].[Loan] CHECK CONSTRAINT [FK_Loan_Mitglied]
GO
```

## Lizenz

Dieses Projekt steht unter der MIT-Lizenz.

---


**Viel Spaß beim Entwickeln und Verwalten deiner Bücherei!**
