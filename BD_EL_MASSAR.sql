USE [master]
GO
/****** Object:  Database [data_warehouse]    Script Date: 06/06/2022 18:02:02 ******/
CREATE DATABASE [data_warehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'data_warehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\data_warehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'data_warehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\data_warehouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [data_warehouse] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [data_warehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [data_warehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [data_warehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [data_warehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [data_warehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [data_warehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [data_warehouse] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [data_warehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [data_warehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [data_warehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [data_warehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [data_warehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [data_warehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [data_warehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [data_warehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [data_warehouse] SET  ENABLE_BROKER 
GO
ALTER DATABASE [data_warehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [data_warehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [data_warehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [data_warehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [data_warehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [data_warehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [data_warehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [data_warehouse] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [data_warehouse] SET  MULTI_USER 
GO
ALTER DATABASE [data_warehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [data_warehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [data_warehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [data_warehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [data_warehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [data_warehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [data_warehouse] SET QUERY_STORE = OFF
GO
USE [data_warehouse]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 06/06/2022 18:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[id_Client] [int] NOT NULL,
	[code_Client] [int] NOT NULL,
	[nom_Client] [varchar](20) NOT NULL,
	[num_Tel] [varchar](15) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Client] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Commande]    Script Date: 06/06/2022 18:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Commande](
	[id_Commande] [int] NOT NULL,
	[Date_Commande] [date] NOT NULL,
	[Id_Client] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Commande] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Detail_Livraison]    Script Date: 06/06/2022 18:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Detail_Livraison](
	[id_Livraison] [int] NOT NULL,
	[id_Commande] [int] NOT NULL,
	[id_Produit] [int] NOT NULL,
	[quantite_Livree] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Livraison] ASC,
	[id_Commande] ASC,
	[id_Produit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ligne_Commande]    Script Date: 06/06/2022 18:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ligne_Commande](
	[id_Commande] [int] NOT NULL,
	[id_Produit] [int] NOT NULL,
	[quantite] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Commande] ASC,
	[id_Produit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Livraison]    Script Date: 06/06/2022 18:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Livraison](
	[id_Livraison] [int] NOT NULL,
	[Date_Livraison] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_Livraison] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Produit]    Script Date: 06/06/2022 18:02:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Produit](
	[Id_Article] [int] NOT NULL,
	[Description] [varchar](20) NULL,
	[Prix_Unitaire] [decimal](10, 2) NOT NULL,
	[Quantite_EnStock] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id_Article] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Produit] ADD  DEFAULT ((0)) FOR [Quantite_EnStock]
GO
ALTER TABLE [dbo].[Commande]  WITH CHECK ADD FOREIGN KEY([Id_Client])
REFERENCES [dbo].[Client] ([id_Client])
GO
ALTER TABLE [dbo].[Detail_Livraison]  WITH CHECK ADD FOREIGN KEY([id_Livraison])
REFERENCES [dbo].[Livraison] ([id_Livraison])
GO
ALTER TABLE [dbo].[Detail_Livraison]  WITH CHECK ADD FOREIGN KEY([id_Commande], [id_Produit])
REFERENCES [dbo].[Ligne_Commande] ([id_Commande], [id_Produit])
GO
ALTER TABLE [dbo].[Ligne_Commande]  WITH CHECK ADD FOREIGN KEY([id_Commande])
REFERENCES [dbo].[Commande] ([id_Commande])
GO
ALTER TABLE [dbo].[Ligne_Commande]  WITH CHECK ADD FOREIGN KEY([id_Produit])
REFERENCES [dbo].[Produit] ([Id_Article])
GO
ALTER TABLE [dbo].[Detail_Livraison]  WITH CHECK ADD CHECK  (([quantite_Livree]>(0)))
GO
ALTER TABLE [dbo].[Ligne_Commande]  WITH CHECK ADD CHECK  (([quantite]>(0)))
GO
ALTER TABLE [dbo].[Produit]  WITH CHECK ADD CHECK  (([quantite_EnStock]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [data_warehouse] SET  READ_WRITE 
GO
