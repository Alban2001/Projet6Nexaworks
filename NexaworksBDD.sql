USE [master]
GO
/****** Object:  Database [Nexaworks]    Script Date: 18/06/2025 22:49:46 ******/
CREATE DATABASE [Nexaworks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Nexaworks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Nexaworks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Nexaworks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Nexaworks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Nexaworks] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Nexaworks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Nexaworks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Nexaworks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Nexaworks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Nexaworks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Nexaworks] SET ARITHABORT OFF 
GO
ALTER DATABASE [Nexaworks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Nexaworks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Nexaworks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Nexaworks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Nexaworks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Nexaworks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Nexaworks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Nexaworks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Nexaworks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Nexaworks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Nexaworks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Nexaworks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Nexaworks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Nexaworks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Nexaworks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Nexaworks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Nexaworks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Nexaworks] SET RECOVERY FULL 
GO
ALTER DATABASE [Nexaworks] SET  MULTI_USER 
GO
ALTER DATABASE [Nexaworks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Nexaworks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Nexaworks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Nexaworks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Nexaworks] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Nexaworks', N'ON'
GO
ALTER DATABASE [Nexaworks] SET QUERY_STORE = OFF
GO
USE [Nexaworks]
GO
/****** Object:  Table [dbo].[Logiciel]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logiciel](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_version] [date] NOT NULL,
	[id_produit] [int] NOT NULL,
	[id_version] [int] NOT NULL,
	[id_SystemeExploitation] [int] NOT NULL,
 CONSTRAINT [PK_Logiciel] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Produit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SystemeExploitation]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SystemeExploitation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nom] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_SystemeExploitation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date_creation] [date] NOT NULL,
	[date_resolution] [date] NULL,
	[status] [nvarchar](max) NOT NULL,
	[probleme] [nvarchar](max) NOT NULL,
	[resolution] [nvarchar](max) NULL,
	[id_logiciel] [int] NOT NULL,
 CONSTRAINT [PK_Ticket] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Version]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Version](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[numero] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Version] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Logiciel] ON 

INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (1, CAST(N'2022-07-15' AS Date), 1, 2, 1)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (2, CAST(N'2023-12-06' AS Date), 1, 1, 2)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (3, CAST(N'2024-02-22' AS Date), 2, 6, 3)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (4, CAST(N'2023-07-11' AS Date), 2, 1, 4)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (5, CAST(N'2023-05-30' AS Date), 3, 2, 5)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (6, CAST(N'2023-10-24' AS Date), 4, 1, 1)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (7, CAST(N'2024-02-29' AS Date), 1, 4, 3)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (8, CAST(N'2022-02-23' AS Date), 3, 5, 4)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (9, CAST(N'2022-04-20' AS Date), 2, 5, 2)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (10, CAST(N'2022-08-09' AS Date), 1, 4, 4)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (11, CAST(N'2023-08-08' AS Date), 2, 6, 1)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (12, CAST(N'2024-06-26' AS Date), 4, 2, 5)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (13, CAST(N'2023-10-19' AS Date), 3, 1, 1)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (14, CAST(N'2023-01-20' AS Date), 3, 5, 3)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (15, CAST(N'2023-09-06' AS Date), 1, 3, 6)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (16, CAST(N'2024-03-29' AS Date), 2, 1, 2)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (17, CAST(N'2022-06-01' AS Date), 4, 2, 4)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (18, CAST(N'2022-11-29' AS Date), 3, 2, 2)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (19, CAST(N'2023-12-07' AS Date), 2, 5, 3)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (20, CAST(N'2024-12-21' AS Date), 1, 2, 4)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (21, CAST(N'2024-03-12' AS Date), 4, 1, 3)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (22, CAST(N'2024-10-09' AS Date), 3, 5, 1)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (23, CAST(N'2022-01-18' AS Date), 1, 1, 4)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (24, CAST(N'2023-08-19' AS Date), 2, 6, 5)
INSERT [dbo].[Logiciel] ([id], [date_version], [id_produit], [id_version], [id_SystemeExploitation]) VALUES (25, CAST(N'2022-11-07' AS Date), 1, 3, 5)
SET IDENTITY_INSERT [dbo].[Logiciel] OFF
GO
SET IDENTITY_INSERT [dbo].[Produit] ON 

INSERT [dbo].[Produit] ([id], [nom]) VALUES (1, N'Trader en Herbe')
INSERT [dbo].[Produit] ([id], [nom]) VALUES (2, N'Maître des Investissements')
INSERT [dbo].[Produit] ([id], [nom]) VALUES (3, N'Planificateur d’Entraînement')
INSERT [dbo].[Produit] ([id], [nom]) VALUES (4, N'Planificateur d’Anxiété Sociale')
SET IDENTITY_INSERT [dbo].[Produit] OFF
GO
SET IDENTITY_INSERT [dbo].[SystemeExploitation] ON 

INSERT [dbo].[SystemeExploitation] ([id], [nom]) VALUES (1, N'Windows')
INSERT [dbo].[SystemeExploitation] ([id], [nom]) VALUES (2, N'Linux')
INSERT [dbo].[SystemeExploitation] ([id], [nom]) VALUES (3, N'Android')
INSERT [dbo].[SystemeExploitation] ([id], [nom]) VALUES (4, N'MacOS')
INSERT [dbo].[SystemeExploitation] ([id], [nom]) VALUES (5, N'iOS')
INSERT [dbo].[SystemeExploitation] ([id], [nom]) VALUES (6, N'Windows Mobile')
SET IDENTITY_INSERT [dbo].[SystemeExploitation] OFF
GO
SET IDENTITY_INSERT [dbo].[Ticket] ON 

INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (5, CAST(N'2023-01-10' AS Date), CAST(N'2023-01-28' AS Date), N'Résolu', N'Crash lors de la connexion au serveur.', N'Problème de certificat SSL expiré corrigé.', 1)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (6, CAST(N'2023-03-05' AS Date), CAST(N'2023-03-12' AS Date), N'Résolu', N'Lancement impossible sur certaines distributions.', N'Dépendance manquante ajoutée à l’installateur.', 2)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (7, CAST(N'2023-04-18' AS Date), CAST(N'2023-05-03' AS Date), N'Résolu', N'Graphiques ne s’affichent pas.', N'Correction d’un bug dans le moteur de rendu SVG.', 3)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (8, CAST(N'2023-02-14' AS Date), CAST(N'2023-03-01' AS Date), N'Résolu', N'Données financières affichées incorrectement.', N'Conversion erronée de devises corrigée.', 4)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (9, CAST(N'2024-01-02' AS Date), CAST(N'2024-01-12' AS Date), N'Résolu', N'Notification de rappel envoyée à minuit.', N'Correction du fuseau horaire mal géré.', 5)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (10, CAST(N'2024-03-03' AS Date), CAST(N'2024-03-15' AS Date), N'Résolu', N'Blocage de l’application après démarrage.', N'Mise à jour du framework .NET.', 6)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (11, CAST(N'2024-04-20' AS Date), NULL, N'En cours', N'Mauvaise taille de police sur certains écrans.', NULL, 7)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (12, CAST(N'2023-06-11' AS Date), CAST(N'2023-06-25' AS Date), N'Résolu', N'Synchronisation iCloud échoue.', N'Erreur d’autorisation corrigée.', 8)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (13, CAST(N'2023-05-28' AS Date), NULL, N'En cours', N'Lenteur de l’interface utilisateur.', NULL, 9)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (14, CAST(N'2023-08-06' AS Date), CAST(N'2023-08-22' AS Date), N'Résolu', N'Historique des transactions vide après redémarrage.', N'Problème de cache corrigé.', 10)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (15, CAST(N'2023-07-30' AS Date), CAST(N'2023-08-08' AS Date), N'Résolu', N'Mauvais taux de change USD/EUR appliqué.', N'Correction dans l’API externe de conversion.', 11)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (16, CAST(N'2024-01-12' AS Date), CAST(N'2024-01-21' AS Date), N'Résolu', N'Journal d’humeur non sauvegardé.', N'Correction d’un conflit de permission.', 12)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (17, CAST(N'2023-03-09' AS Date), CAST(N'2023-03-18' AS Date), N'Résolu', N'Impossible de créer une séance.', N'Correction de la validation du formulaire.', 13)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (18, CAST(N'2023-11-27' AS Date), CAST(N'2023-12-06' AS Date), N'Résolu', N'Vidéo d’exercices ne se lance pas.', N'Problème de compatibilité avec certaines versions Android.', 14)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (19, CAST(N'2023-04-04' AS Date), CAST(N'2023-04-17' AS Date), N'Résolu', N'Boutons décalés sur l’écran principal.', N'Mise à jour du moteur d’interface utilisateur.', 15)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (20, CAST(N'2023-02-05' AS Date), CAST(N'2023-02-14' AS Date), N'Résolu', N'Interface graphique gelée au démarrage.', N'Suppression d’un processus bloquant dans l’init.', 16)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (21, CAST(N'2024-04-02' AS Date), NULL, N'En cours', N'Graphique hebdomadaire incomplet.', NULL, 17)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (22, CAST(N'2023-10-13' AS Date), CAST(N'2023-10-28' AS Date), N'Résolu', N'Problème de compatibilité avec le kernel 5.15+.', N'Ajout d’un patch au lancement.', 18)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (23, CAST(N'2023-05-03' AS Date), CAST(N'2023-05-11' AS Date), N'Résolu', N'Graphique de portefeuille bloqué.', N'Correction du cache local.', 19)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (24, CAST(N'2023-01-06' AS Date), CAST(N'2023-01-15' AS Date), N'Résolu', N'L’application reste bloquée sur l’écran de chargement.', N'Suppression du timeout bloquant.', 20)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (25, CAST(N'2024-02-19' AS Date), NULL, N'En cours', N'Les notifications s’envoient par erreur 2 fois.', NULL, 21)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (26, CAST(N'2023-09-22' AS Date), CAST(N'2023-10-04' AS Date), N'Résolu', N'Texte flou dans certaines résolutions d’écran.', N'Amélioration de la gestion DPI.', 22)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (27, CAST(N'2023-03-28' AS Date), CAST(N'2023-04-06' AS Date), N'Résolu', N'Les cours boursiers ne se mettent pas à jour.', N'Reconnexion automatique à l’API réactivée.', 23)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (28, CAST(N'2023-08-12' AS Date), CAST(N'2023-08-25' AS Date), N'Résolu', N'Défilement trop rapide des graphiques.', N'Ajout d’un throttling au scroll.', 24)
INSERT [dbo].[Ticket] ([id], [date_creation], [date_resolution], [status], [probleme], [resolution], [id_logiciel]) VALUES (29, CAST(N'2023-03-02' AS Date), CAST(N'2023-04-16' AS Date), N'Résolu', N'Achats en double si bouton cliqué deux fois.', N'Ajout d’une animation et désactivation du bouton après premier clic.', 25)
SET IDENTITY_INSERT [dbo].[Ticket] OFF
GO
SET IDENTITY_INSERT [dbo].[Version] ON 

INSERT [dbo].[Version] ([id], [numero]) VALUES (1, N'1.0')
INSERT [dbo].[Version] ([id], [numero]) VALUES (2, N'1.1')
INSERT [dbo].[Version] ([id], [numero]) VALUES (3, N'1.2')
INSERT [dbo].[Version] ([id], [numero]) VALUES (4, N'1.3')
INSERT [dbo].[Version] ([id], [numero]) VALUES (5, N'2.0')
INSERT [dbo].[Version] ([id], [numero]) VALUES (6, N'2.1')
SET IDENTITY_INSERT [dbo].[Version] OFF
GO
/****** Object:  Index [FK_Logiciel_Produit]    Script Date: 18/06/2025 22:49:46 ******/
CREATE NONCLUSTERED INDEX [FK_Logiciel_Produit] ON [dbo].[Logiciel]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Logiciel_Version]    Script Date: 18/06/2025 22:49:46 ******/
CREATE NONCLUSTERED INDEX [FK_Logiciel_Version] ON [dbo].[Logiciel]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_LogicielSystemeExploitation]    Script Date: 18/06/2025 22:49:46 ******/
CREATE NONCLUSTERED INDEX [FK_LogicielSystemeExploitation] ON [dbo].[Logiciel]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [FK_Ticket_Logiciel]    Script Date: 18/06/2025 22:49:46 ******/
CREATE NONCLUSTERED INDEX [FK_Ticket_Logiciel] ON [dbo].[Ticket]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Ticket] ADD  CONSTRAINT [DF_Ticket_resolution]  DEFAULT ('') FOR [resolution]
GO
ALTER TABLE [dbo].[Logiciel]  WITH CHECK ADD  CONSTRAINT [FK_Logiciel_Produit] FOREIGN KEY([id_produit])
REFERENCES [dbo].[Produit] ([id])
GO
ALTER TABLE [dbo].[Logiciel] CHECK CONSTRAINT [FK_Logiciel_Produit]
GO
ALTER TABLE [dbo].[Logiciel]  WITH CHECK ADD  CONSTRAINT [FK_Logiciel_SystemeExploitation] FOREIGN KEY([id_SystemeExploitation])
REFERENCES [dbo].[SystemeExploitation] ([id])
GO
ALTER TABLE [dbo].[Logiciel] CHECK CONSTRAINT [FK_Logiciel_SystemeExploitation]
GO
ALTER TABLE [dbo].[Logiciel]  WITH CHECK ADD  CONSTRAINT [FK_Logiciel_Version] FOREIGN KEY([id_version])
REFERENCES [dbo].[Version] ([id])
GO
ALTER TABLE [dbo].[Logiciel] CHECK CONSTRAINT [FK_Logiciel_Version]
GO
ALTER TABLE [dbo].[SystemeExploitation]  WITH CHECK ADD  CONSTRAINT [FK_SystemeExploitation_SystemeExploitation] FOREIGN KEY([id])
REFERENCES [dbo].[SystemeExploitation] ([id])
GO
ALTER TABLE [dbo].[SystemeExploitation] CHECK CONSTRAINT [FK_SystemeExploitation_SystemeExploitation]
GO
ALTER TABLE [dbo].[Ticket]  WITH CHECK ADD  CONSTRAINT [FK_Ticket_Logiciel] FOREIGN KEY([id_logiciel])
REFERENCES [dbo].[Logiciel] ([id])
GO
ALTER TABLE [dbo].[Ticket] CHECK CONSTRAINT [FK_Ticket_Logiciel]
GO
/****** Object:  StoredProcedure [dbo].[ListeProblemesEnCours]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alban VOIRIOT
-- Create date: 08/06/2025
-- Description:	Affichage de la liste des problèmes en cours
-- =============================================

CREATE PROCEDURE [dbo].[ListeProblemesEnCours] 
	-- Add the parameters for the stored procedure here
	@nomProduit varchar(max) = '', 
	@numVersion varchar(max) = '', 
	@probleme varchar(max) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	SELECT dbo.Ticket.id, dbo.Produit.nom, dbo.Version.numero, dbo.Ticket.date_creation, dbo.Ticket.probleme
	FROM     dbo.Logiciel INNER JOIN
                  dbo.Ticket ON dbo.Logiciel.id = dbo.Ticket.id_logiciel INNER JOIN
                  dbo.Produit ON dbo.Logiciel.id_produit = dbo.Produit.id INNER JOIN
                  dbo.Version ON dbo.Logiciel.id_version = dbo.Version.id
	WHERE  (dbo.Ticket.status = 'En Cours') 
	AND (@nomProduit = '' OR dbo.Produit.nom LIKE '%' + @nomProduit + '%') 
	AND (@numVersion = '' OR dbo.Version.numero = @numVersion) 
	AND (@probleme = '' OR dbo.Ticket.probleme LIKE '%' + @probleme + '%') 

END
GO
/****** Object:  StoredProcedure [dbo].[ListeProblemesEnCoursPeriode]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alban VOIRIOT
-- Create date: 10/06/2025
-- Description:	Affichage de la liste des problème en cours avec une période donnée
-- =============================================
CREATE PROCEDURE [dbo].[ListeProblemesEnCoursPeriode] 
	-- Add the parameters for the stored procedure here
	@nomProduit varchar(max) = '', 
	@numVersion varchar(max) = '', 
	@probleme varchar(max) = '', 
	@dateDebut varchar(max) = '', 
	@dateFin varchar(max) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Ticket.id, dbo.Produit.nom, dbo.Version.numero, dbo.Ticket.date_creation, dbo.Ticket.probleme
	FROM     dbo.Logiciel INNER JOIN
                  dbo.Ticket ON dbo.Logiciel.id = dbo.Ticket.id_logiciel INNER JOIN
                  dbo.Produit ON dbo.Logiciel.id_produit = dbo.Produit.id INNER JOIN
                  dbo.Version ON dbo.Logiciel.id_version = dbo.Version.id
	WHERE  (dbo.Ticket.status = 'En Cours') 
	AND (@nomProduit = '' OR dbo.Produit.nom LIKE '%' + @nomProduit + '%') 
	AND (@numVersion = '' OR dbo.Version.numero = @numVersion) 
	AND (@probleme = '' OR dbo.Ticket.probleme LIKE '%' + @probleme + '%') 
	AND (dbo.Ticket.date_creation >= @dateDebut AND dbo.Ticket.date_creation <= @dateFin)
END
GO
/****** Object:  StoredProcedure [dbo].[ListeProblemesResolus]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alban VOIRIOT
-- Create date: 10/06/2025
-- Description:	Affichage de la liste des problèmes résolus
-- =============================================
CREATE PROCEDURE [dbo].[ListeProblemesResolus] 
	-- Add the parameters for the stored procedure here
	@nomProduit varchar(max) = '', 
	@numVersion varchar(max) = '', 
	@probleme varchar(max) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Ticket.id, dbo.Produit.nom, dbo.Version.numero, dbo.Ticket.date_creation, dbo.Ticket.probleme, dbo.Ticket.resolution, dbo.Ticket.date_resolution
	FROM     dbo.Logiciel INNER JOIN
                  dbo.Ticket ON dbo.Logiciel.id = dbo.Ticket.id_logiciel INNER JOIN
                  dbo.Produit ON dbo.Logiciel.id_produit = dbo.Produit.id INNER JOIN
                  dbo.Version ON dbo.Logiciel.id_version = dbo.Version.id
	WHERE  (dbo.Ticket.status = 'Résolu') 
	AND (@nomProduit = '' OR dbo.Produit.nom LIKE '%' + @nomProduit + '%') 
	AND (@numVersion = '' OR dbo.Version.numero = @numVersion) 
	AND (@probleme = '' OR dbo.Ticket.probleme LIKE '%' + @probleme + '%') 
END
GO
/****** Object:  StoredProcedure [dbo].[ListeProblemesResolusPeriode]    Script Date: 18/06/2025 22:49:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Alban VOIRIOT
-- Create date: 10/06/2025
-- Description:	Affichage de la liste des problèmes résolus avec une période donnée
-- =============================================
CREATE PROCEDURE [dbo].[ListeProblemesResolusPeriode] 
	-- Add the parameters for the stored procedure here
	@nomProduit varchar(max) = '', 
	@numVersion varchar(max) = '', 
	@probleme varchar(max) = '', 
	@dateDebut varchar(max) = '', 
	@dateFin varchar(max) = ''
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT dbo.Ticket.id, dbo.Produit.nom, dbo.Version.numero, dbo.Ticket.date_creation, dbo.Ticket.probleme
	FROM     dbo.Logiciel INNER JOIN
                  dbo.Ticket ON dbo.Logiciel.id = dbo.Ticket.id_logiciel INNER JOIN
                  dbo.Produit ON dbo.Logiciel.id_produit = dbo.Produit.id INNER JOIN
                  dbo.Version ON dbo.Logiciel.id_version = dbo.Version.id
	WHERE  (dbo.Ticket.status = 'Résolu') 
	AND (@nomProduit = '' OR dbo.Produit.nom LIKE '%' + @nomProduit + '%') 
	AND (@numVersion = '' OR dbo.Version.numero = @numVersion) 
	AND (@probleme = '' OR dbo.Ticket.probleme LIKE '%' + @probleme + '%') 
	AND (dbo.Ticket.date_creation >= @dateDebut AND dbo.Ticket.date_creation <= @dateFin)
END
GO
USE [master]
GO
ALTER DATABASE [Nexaworks] SET  READ_WRITE 
GO
