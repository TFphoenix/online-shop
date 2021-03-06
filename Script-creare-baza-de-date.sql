USE [master]
GO
/****** Object:  Database [BDProiect]    Script Date: 18.05.2020 12:57:29 ******/
CREATE DATABASE [BDProiect]
 
GO

GO
USE [BDProiect]
GO
/****** Object:  Table [dbo].[Caracteristica]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Caracteristica](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DenumireCaracteristica] [nvarchar](50) NULL,
 CONSTRAINT [PK_Caracteristica] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CaracteristiciProdus]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaracteristiciProdus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProdus] [int] NULL,
	[IdCaracteristica] [int] NULL,
	[Valoare] [nvarchar](250) NULL,
 CONSTRAINT [PK_CaracteristiciProdus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategorieProdus]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategorieProdus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DenumireCategorie] [nvarchar](50) NULL,
	[DescriereCategorie] [nvarchar](250) NULL,
 CONSTRAINT [PK_CategorieProdus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Client]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nume] [nvarchar](50) NULL,
	[Prenume] [nvarchar](50) NULL,
	[Telefon] [nvarchar](15) NULL,
	[Adresa] [nvarchar](250) NULL,
	[Localitate] [nvarchar](50) NULL,
	[IdUtilizator] [int] NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comanda]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comanda](
	[NumarComanda] [int] IDENTITY(1,1) NOT NULL,
	[DataOraComanda] [datetime] NULL,
	[IdClient] [int] NULL,
 CONSTRAINT [PK_Comanda] PRIMARY KEY CLUSTERED 
(
	[NumarComanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Pret]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pret](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProdus] [int] NULL,
	[Pret] [decimal](18, 2) NULL,
	[DataOraInceput] [datetime] NULL,
	[DataOraSfarsit] [datetime] NULL,
 CONSTRAINT [PK_Pret] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Produs]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DenumireProdus] [nvarchar](250) NULL,
	[Descriere] [nvarchar](500) NULL,
	[IdCategorieProdus] [int] NULL,
	[Foto1] [nvarchar](250) NULL,
	[Foto2] [nvarchar](250) NULL,
 CONSTRAINT [PK_Produs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProduseComandate]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProduseComandate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProdus] [int] NULL,
	[NumarComanda] [int] NULL,
	[CantitateComandata] [int] NULL,
	[IdPret] [int] NULL,
 CONSTRAINT [PK_ProduseComandate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Utilizator]    Script Date: 18.05.2020 12:57:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Utilizator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NumeUtilizator] [nvarchar](50) NULL,
	[Parola] [nvarchar](50) NULL,
	[Blocat] [bit] NULL,
	[DataCreareCont] [date] NULL,
 CONSTRAINT [PK_Utilizator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[CaracteristiciProdus]  WITH CHECK ADD  CONSTRAINT [FK_CaracteristiciProdus_Caracteristica] FOREIGN KEY([IdCaracteristica])
REFERENCES [dbo].[Caracteristica] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CaracteristiciProdus] CHECK CONSTRAINT [FK_CaracteristiciProdus_Caracteristica]
GO
ALTER TABLE [dbo].[CaracteristiciProdus]  WITH CHECK ADD  CONSTRAINT [FK_CaracteristiciProdus_Produs] FOREIGN KEY([IdProdus])
REFERENCES [dbo].[Produs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CaracteristiciProdus] CHECK CONSTRAINT [FK_CaracteristiciProdus_Produs]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Utilizator] FOREIGN KEY([IdUtilizator])
REFERENCES [dbo].[Utilizator] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Utilizator]
GO
ALTER TABLE [dbo].[Comanda]  WITH CHECK ADD  CONSTRAINT [FK_Comanda_Client] FOREIGN KEY([IdClient])
REFERENCES [dbo].[Client] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comanda] CHECK CONSTRAINT [FK_Comanda_Client]
GO
ALTER TABLE [dbo].[Pret]  WITH CHECK ADD  CONSTRAINT [FK_Pret_Produs] FOREIGN KEY([IdProdus])
REFERENCES [dbo].[Produs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Pret] CHECK CONSTRAINT [FK_Pret_Produs]
GO
ALTER TABLE [dbo].[Produs]  WITH CHECK ADD  CONSTRAINT [FK_Produs_CategorieProdus] FOREIGN KEY([IdCategorieProdus])
REFERENCES [dbo].[CategorieProdus] ([Id])
GO
ALTER TABLE [dbo].[Produs] CHECK CONSTRAINT [FK_Produs_CategorieProdus]
GO
ALTER TABLE [dbo].[ProduseComandate]  WITH CHECK ADD  CONSTRAINT [FK_ProduseComandate_Comanda] FOREIGN KEY([NumarComanda])
REFERENCES [dbo].[Comanda] ([NumarComanda])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProduseComandate] CHECK CONSTRAINT [FK_ProduseComandate_Comanda]
GO
ALTER TABLE [dbo].[ProduseComandate]  WITH CHECK ADD  CONSTRAINT [FK_ProduseComandate_Pret] FOREIGN KEY([IdPret])
REFERENCES [dbo].[Pret] ([Id])
GO
ALTER TABLE [dbo].[ProduseComandate] CHECK CONSTRAINT [FK_ProduseComandate_Pret]
GO
ALTER TABLE [dbo].[ProduseComandate]  WITH CHECK ADD  CONSTRAINT [FK_ProduseComandate_Produs] FOREIGN KEY([IdProdus])
REFERENCES [dbo].[Produs] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProduseComandate] CHECK CONSTRAINT [FK_ProduseComandate_Produs]
GO
USE [master]
GO
ALTER DATABASE [BDProiect] SET  READ_WRITE 
GO
