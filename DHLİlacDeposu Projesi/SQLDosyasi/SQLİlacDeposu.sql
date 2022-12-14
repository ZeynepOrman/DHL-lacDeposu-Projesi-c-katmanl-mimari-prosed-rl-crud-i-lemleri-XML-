USE [master]
GO
/****** Object:  Database [İlacDeposu]    Script Date: 7.12.2022 23:54:50 ******/
CREATE DATABASE [İlacDeposu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'İlacDeposu', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\İlacDeposu.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'İlacDeposu_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\İlacDeposu_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [İlacDeposu] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [İlacDeposu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [İlacDeposu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [İlacDeposu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [İlacDeposu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [İlacDeposu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [İlacDeposu] SET ARITHABORT OFF 
GO
ALTER DATABASE [İlacDeposu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [İlacDeposu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [İlacDeposu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [İlacDeposu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [İlacDeposu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [İlacDeposu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [İlacDeposu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [İlacDeposu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [İlacDeposu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [İlacDeposu] SET  DISABLE_BROKER 
GO
ALTER DATABASE [İlacDeposu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [İlacDeposu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [İlacDeposu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [İlacDeposu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [İlacDeposu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [İlacDeposu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [İlacDeposu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [İlacDeposu] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [İlacDeposu] SET  MULTI_USER 
GO
ALTER DATABASE [İlacDeposu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [İlacDeposu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [İlacDeposu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [İlacDeposu] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [İlacDeposu] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [İlacDeposu] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [İlacDeposu] SET QUERY_STORE = OFF
GO
USE [İlacDeposu]
GO
/****** Object:  Table [dbo].[İlac_Depo]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlac_Depo](
	[DepoNo] [int] IDENTITY(1,1) NOT NULL,
	[DepoAdi] [varchar](50) NULL,
 CONSTRAINT [PK_İlac_Depo] PRIMARY KEY CLUSTERED 
(
	[DepoNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İlac_DepoPersoneli]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlac_DepoPersoneli](
	[DepoPersoneliNo] [int] IDENTITY(1,1) NOT NULL,
	[DepoPersoneliAdSoyad] [varchar](50) NULL,
	[Unvan] [varchar](50) NULL,
 CONSTRAINT [PK_İlac_DepoPersoneli] PRIMARY KEY CLUSTERED 
(
	[DepoPersoneliNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İlac_Firma]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlac_Firma](
	[FirmaNo] [int] IDENTITY(1,1) NOT NULL,
	[FirmaAdi] [varchar](50) NULL,
	[FirmaSorumlusu] [varchar](50) NULL,
	[BorcDurumu] [money] NULL,
 CONSTRAINT [PK_İlac_Firma] PRIMARY KEY CLUSTERED 
(
	[FirmaNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İlac_Gelenİlac]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlac_Gelenİlac](
	[GelenİlacNo] [int] IDENTITY(1,1) NOT NULL,
	[GelenİlacAdi] [varchar](50) NULL,
	[GelenİlacBarkodNo] [int] NULL,
	[GelenİlacUretimTarihi] [datetime] NULL,
	[GelenİlacTuketimTarihi] [datetime] NULL,
	[GelenİlacAlinanFirma] [varchar](50) NULL,
	[GelenİlacSatilanFirma] [varchar](50) NULL,
	[DepoNo] [int] NULL,
	[FirmaNo] [int] NULL,
 CONSTRAINT [PK_İlac_Gelenİlac] PRIMARY KEY CLUSTERED 
(
	[GelenİlacNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İlac_GeriGelenİlac]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlac_GeriGelenİlac](
	[GeriGelenİlacNo] [int] IDENTITY(1,1) NOT NULL,
	[GeriGelenİlacAdi] [varchar](50) NULL,
	[GeriGelenİlacBarkodNo] [int] NULL,
	[GeriGelenİlacUretimTarihi] [datetime] NULL,
	[GeriGelenİlacTuketimTarihi] [datetime] NULL,
	[GeriGelenİlacSatilanFirmaAdi] [varchar](50) NULL,
	[FirmaNo] [int] NULL,
 CONSTRAINT [PK_İlac_GeriGelenİlac] PRIMARY KEY CLUSTERED 
(
	[GeriGelenİlacNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[İlac_İadeEdilenİlac]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[İlac_İadeEdilenİlac](
	[İadeEdilenİlacNo] [int] IDENTITY(1,1) NOT NULL,
	[İadeEdilenİlacAdi] [varchar](50) NULL,
	[İadeEdilenİlacBarkodNo] [int] NULL,
	[İadeEdilenİlacUretimTarihi] [datetime] NULL,
	[İadeEdilenİlacTuketimTarihi] [datetime] NULL,
	[İadeEdilenİlacAlinanFirmaAdi] [varchar](50) NULL,
	[DepoNo] [int] NULL,
 CONSTRAINT [PK_İlac_İadeEdilenİlac] PRIMARY KEY CLUSTERED 
(
	[İadeEdilenİlacNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KullaniciKayit]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KullaniciKayit](
	[KullaniciAdi] [varchar](50) NOT NULL,
	[Sifre] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[Telefon] [varchar](50) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[İlac_Depo] ON 

INSERT [dbo].[İlac_Depo] ([DepoNo], [DepoAdi]) VALUES (1, N'DHL Esenyurt')
SET IDENTITY_INSERT [dbo].[İlac_Depo] OFF
GO
SET IDENTITY_INSERT [dbo].[İlac_DepoPersoneli] ON 

INSERT [dbo].[İlac_DepoPersoneli] ([DepoPersoneliNo], [DepoPersoneliAdSoyad], [Unvan]) VALUES (1, N'Kerem Alaç', N'Uzman')
INSERT [dbo].[İlac_DepoPersoneli] ([DepoPersoneliNo], [DepoPersoneliAdSoyad], [Unvan]) VALUES (2, N'Ali Alıç', N'Uzman')
INSERT [dbo].[İlac_DepoPersoneli] ([DepoPersoneliNo], [DepoPersoneliAdSoyad], [Unvan]) VALUES (3, N'Hilal Yapıcı', N'Stajyer')
INSERT [dbo].[İlac_DepoPersoneli] ([DepoPersoneliNo], [DepoPersoneliAdSoyad], [Unvan]) VALUES (6, N'Sema Kal', N'Uzman')
SET IDENTITY_INSERT [dbo].[İlac_DepoPersoneli] OFF
GO
SET IDENTITY_INSERT [dbo].[İlac_Firma] ON 

INSERT [dbo].[İlac_Firma] ([FirmaNo], [FirmaAdi], [FirmaSorumlusu], [BorcDurumu]) VALUES (1, N'Pfizer', N'Saime Hasdemir', 5000.0000)
INSERT [dbo].[İlac_Firma] ([FirmaNo], [FirmaAdi], [FirmaSorumlusu], [BorcDurumu]) VALUES (2, N'Sandoz', N'Saime Hasdemir', 10000.0000)
INSERT [dbo].[İlac_Firma] ([FirmaNo], [FirmaAdi], [FirmaSorumlusu], [BorcDurumu]) VALUES (3, N'Bayer', N'Saime Hasdemir', 10000.0000)
SET IDENTITY_INSERT [dbo].[İlac_Firma] OFF
GO
SET IDENTITY_INSERT [dbo].[İlac_Gelenİlac] ON 

INSERT [dbo].[İlac_Gelenİlac] ([GelenİlacNo], [GelenİlacAdi], [GelenİlacBarkodNo], [GelenİlacUretimTarihi], [GelenİlacTuketimTarihi], [GelenİlacAlinanFirma], [GelenİlacSatilanFirma], [DepoNo], [FirmaNo]) VALUES (1, N'Aspirin', 12345, CAST(N'2022-10-12T00:00:00.000' AS DateTime), CAST(N'2024-10-12T00:00:00.000' AS DateTime), N'Pfizer Almanya', N'Bilim İlaç', NULL, NULL)
INSERT [dbo].[İlac_Gelenİlac] ([GelenİlacNo], [GelenİlacAdi], [GelenİlacBarkodNo], [GelenİlacUretimTarihi], [GelenİlacTuketimTarihi], [GelenİlacAlinanFirma], [GelenİlacSatilanFirma], [DepoNo], [FirmaNo]) VALUES (2, N'Majezik', 12346, CAST(N'2022-10-20T00:00:00.000' AS DateTime), CAST(N'2024-10-20T00:00:00.000' AS DateTime), N'Roche Almanya', N'Sanovel', NULL, NULL)
INSERT [dbo].[İlac_Gelenİlac] ([GelenİlacNo], [GelenİlacAdi], [GelenİlacBarkodNo], [GelenİlacUretimTarihi], [GelenİlacTuketimTarihi], [GelenİlacAlinanFirma], [GelenİlacSatilanFirma], [DepoNo], [FirmaNo]) VALUES (3, N'Xanax', 12347, CAST(N'2022-10-30T00:00:00.000' AS DateTime), CAST(N'2024-10-30T00:00:00.000' AS DateTime), N'Merck', N'Novartis', NULL, NULL)
SET IDENTITY_INSERT [dbo].[İlac_Gelenİlac] OFF
GO
SET IDENTITY_INSERT [dbo].[İlac_GeriGelenİlac] ON 

INSERT [dbo].[İlac_GeriGelenİlac] ([GeriGelenİlacNo], [GeriGelenİlacAdi], [GeriGelenİlacBarkodNo], [GeriGelenİlacUretimTarihi], [GeriGelenİlacTuketimTarihi], [GeriGelenİlacSatilanFirmaAdi], [FirmaNo]) VALUES (1, N'Bayer', 34567, CAST(N'2021-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), N'Novartis', NULL)
INSERT [dbo].[İlac_GeriGelenİlac] ([GeriGelenİlacNo], [GeriGelenİlacAdi], [GeriGelenİlacBarkodNo], [GeriGelenİlacUretimTarihi], [GeriGelenİlacTuketimTarihi], [GeriGelenİlacSatilanFirmaAdi], [FirmaNo]) VALUES (2, N'Bayer', 34567, CAST(N'2021-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), N'Novartis', NULL)
INSERT [dbo].[İlac_GeriGelenİlac] ([GeriGelenİlacNo], [GeriGelenİlacAdi], [GeriGelenİlacBarkodNo], [GeriGelenİlacUretimTarihi], [GeriGelenİlacTuketimTarihi], [GeriGelenİlacSatilanFirmaAdi], [FirmaNo]) VALUES (3, N'Pfizer', 34567, CAST(N'2021-12-12T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), N'Novartis', NULL)
SET IDENTITY_INSERT [dbo].[İlac_GeriGelenİlac] OFF
GO
SET IDENTITY_INSERT [dbo].[İlac_İadeEdilenİlac] ON 

INSERT [dbo].[İlac_İadeEdilenİlac] ([İadeEdilenİlacNo], [İadeEdilenİlacAdi], [İadeEdilenİlacBarkodNo], [İadeEdilenİlacUretimTarihi], [İadeEdilenİlacTuketimTarihi], [İadeEdilenİlacAlinanFirmaAdi], [DepoNo]) VALUES (1, N'Biontech', 1236, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'Pfizer', 1)
INSERT [dbo].[İlac_İadeEdilenİlac] ([İadeEdilenİlacNo], [İadeEdilenİlacAdi], [İadeEdilenİlacBarkodNo], [İadeEdilenİlacUretimTarihi], [İadeEdilenİlacTuketimTarihi], [İadeEdilenİlacAlinanFirmaAdi], [DepoNo]) VALUES (3, N'Aspirin', 1236, CAST(N'2022-12-12T00:00:00.000' AS DateTime), CAST(N'2024-12-12T00:00:00.000' AS DateTime), N'Pfizer', NULL)
SET IDENTITY_INSERT [dbo].[İlac_İadeEdilenİlac] OFF
GO
INSERT [dbo].[KullaniciKayit] ([KullaniciAdi], [Sifre], [Email], [Telefon]) VALUES (N'admin', N'1234', N'@gmail.com', N'123456789')
INSERT [dbo].[KullaniciKayit] ([KullaniciAdi], [Sifre], [Email], [Telefon]) VALUES (N'caglar', N'1234', N'ds', N'123456789')
INSERT [dbo].[KullaniciKayit] ([KullaniciAdi], [Sifre], [Email], [Telefon]) VALUES (N'talha', N'1234', N'kemaltalhakoc@gmail.com', N'123456789')
INSERT [dbo].[KullaniciKayit] ([KullaniciAdi], [Sifre], [Email], [Telefon]) VALUES (N'zeynep', N'1234', N'@gmail.com', N'(534) 895-1605')
INSERT [dbo].[KullaniciKayit] ([KullaniciAdi], [Sifre], [Email], [Telefon]) VALUES (N'a', N'1', N'a', N'(212) 312-3223')
GO
ALTER TABLE [dbo].[İlac_Gelenİlac]  WITH CHECK ADD  CONSTRAINT [FK_İlac_Gelenİlac_İlac_Depo] FOREIGN KEY([DepoNo])
REFERENCES [dbo].[İlac_Depo] ([DepoNo])
GO
ALTER TABLE [dbo].[İlac_Gelenİlac] CHECK CONSTRAINT [FK_İlac_Gelenİlac_İlac_Depo]
GO
ALTER TABLE [dbo].[İlac_Gelenİlac]  WITH CHECK ADD  CONSTRAINT [FK_İlac_Gelenİlac_İlac_Firma] FOREIGN KEY([FirmaNo])
REFERENCES [dbo].[İlac_Firma] ([FirmaNo])
GO
ALTER TABLE [dbo].[İlac_Gelenİlac] CHECK CONSTRAINT [FK_İlac_Gelenİlac_İlac_Firma]
GO
ALTER TABLE [dbo].[İlac_GeriGelenİlac]  WITH CHECK ADD  CONSTRAINT [FK_İlac_GeriGelenİlac_İlac_Firma] FOREIGN KEY([FirmaNo])
REFERENCES [dbo].[İlac_Firma] ([FirmaNo])
GO
ALTER TABLE [dbo].[İlac_GeriGelenİlac] CHECK CONSTRAINT [FK_İlac_GeriGelenİlac_İlac_Firma]
GO
ALTER TABLE [dbo].[İlac_İadeEdilenİlac]  WITH CHECK ADD  CONSTRAINT [FK_İlac_İadeEdilenİlac_İlac_Depo] FOREIGN KEY([DepoNo])
REFERENCES [dbo].[İlac_Depo] ([DepoNo])
GO
ALTER TABLE [dbo].[İlac_İadeEdilenİlac] CHECK CONSTRAINT [FK_İlac_İadeEdilenİlac_İlac_Depo]
GO
/****** Object:  StoredProcedure [dbo].[DepoNoSec]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DepoNoSec]

as begin
select * from İlac_Depo
end
GO
/****** Object:  StoredProcedure [dbo].[DepoPersoneliEkle]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DepoPersoneliEkle]
@DepoPersoneliAdSoyad varchar(50),
@Unvan varchar(50)

as
insert into İlac_DepoPersoneli(DepoPersoneliAdSoyad,Unvan)
values(@DepoPersoneliAdSoyad, @Unvan)
GO
/****** Object:  StoredProcedure [dbo].[DepoPersoneliListele]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DepoPersoneliListele]
as begin
select*from İlac_DepoPersoneli
end
GO
/****** Object:  StoredProcedure [dbo].[DepoPersoneliSil]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[DepoPersoneliSil]
@DepoPersoneliNo int

as begin
delete from İlac_DepoPersoneli where DepoPersoneliNo=@DepoPersoneliNo
end
GO
/****** Object:  StoredProcedure [dbo].[DepoPersoneliYenile]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[DepoPersoneliYenile]
@DepoPersoneliNo int,
@DepoPersoneliAdSoyad varchar(50),
@Unvan varchar(50)

as begin
update İlac_DepoPersoneli set DepoPersoneliAdSoyad=@DepoPersoneliAdSoyad, Unvan=@Unvan
where DepoPersoneliNo=@DepoPersoneliNo
end
GO
/****** Object:  StoredProcedure [dbo].[FirmaGelenİlac]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FirmaGelenİlac]
as begin select FirmaAdi,GelenİlacAdi,GelenİlacTuketimTarihi from İlac_Firma f inner join İlac_Gelenİlac g on f.FirmaNo =g.FirmaNo
end
GO
/****** Object:  StoredProcedure [dbo].[FirmanınİadeEttiğiİlacAdedi]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FirmanınİadeEttiğiİlacAdedi]


@FirmaAdi varchar(50)

as begin
select  COUNT (*) as 'Firmanın iade ettiği ilaç adedi' from 
İlac_GeriGelenİlac A inner join İlac_Firma B on A.FirmaNo=B.FirmaNo where FirmaAdi=@FirmaAdi group by GeriGelenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[FirmaNoSec]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[FirmaNoSec]

as begin
select * from İlac_Firma
end
GO
/****** Object:  StoredProcedure [dbo].[FirmayaİadeEdilenİlacAdedi]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[FirmayaİadeEdilenİlacAdedi]


@DepoAdi varchar(50)

as begin
select  COUNT (*) as 'Firmaya İade Edilen İlac Adedi' from 
İlac_İadeEdilenİlac A inner join İlac_Depo B on A.DepoNo=B.DepoNo where DepoAdi=@DepoAdi group by İadeEdilenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_AraDepoPersoneli]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_AraDepoPersoneli]


@DepoPersoneliAdSoyad varchar(50)

as begin 
select * from İlac_DepoPersoneli where  DepoPersoneliAdSoyad=@DepoPersoneliAdSoyad
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_AraFirma]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_AraFirma]

@FirmaAdi varchar(50)

as begin 
select * from İlac_Firma where  FirmaAdi=@FirmaAdi
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_AraGelenİlac]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_AraGelenİlac]

@GelenilacAdi varchar(50)

as begin 
select * from İlac_Gelenİlac where GelenİlacAdi=@GelenilacAdi
end
-------
GO
/****** Object:  StoredProcedure [dbo].[İlac_AraGeriGelenİlac]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[İlac_AraGeriGelenİlac]

@GeriGelenİlacAdi varchar(50)

as begin 
select * from İlac_GeriGelenİlac where GeriGelenİlacAdi=@GeriGelenilacAdi
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_AraİadeEdilenİlac]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_AraİadeEdilenİlac]

@İadeEdilenİlacAdi varchar(50)

as begin 
select * from İlac_İadeEdilenİlac where İadeEdilenİlacAdi=@İadeEdilenİlacAdi
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_GelenİlacEkle]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_GelenİlacEkle]
@GelenİlacAdi varchar(50),
@GelenİlacBarkodNo int,
@GelenİlacUretimTarihi datetime,
@GelenİlacTuketimTarihi datetime,
@GelenİlacAlinanFirma varchar(50),
@GelenİlacSatilanFirma varchar(50)

as
insert into İlac_Gelenİlac(GelenİlacAdi,GelenİlacBarkodNo,GelenİlacUretimTarihi, GelenİlacTuketimTarihi, GelenİlacAlinanFirma, GelenİlacSatilanFirma)
values(@GelenİlacAdi,@GelenİlacBarkodNo,@GelenİlacUretimTarihi,@GelenİlacTuketimTarihi,@GelenİlacAlinanFirma,@GelenİlacSatilanFirma)
GO
/****** Object:  StoredProcedure [dbo].[İlac_GelenİlacListele]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_GelenİlacListele]
as begin
select*from İlac_Gelenİlac
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_GelenİlacSil]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_GelenİlacSil]
@GelenİlacNo int

as begin
delete from İlac_Gelenİlac where GelenİlacNo=@GelenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_GelenİlacYenile]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_GelenİlacYenile]
@GelenİlacNo int,
@GelenİlacAdi varchar(50),
@GelenİlacBarkodNo int,
@GelenİlacUretimTarihi datetime,
@GelenİlacTuketimTarihi datetime,
@GelenİlacAlinanFirma varchar(50),
@GelenİlacSatilanFirma varchar(50)

as begin
update İlac_Gelenİlac set GelenİlacAdi=@GelenİlacAdi, GelenİlacBarkodNo=@GelenİlacBarkodNo, GelenİlacUretimTarihi=@GelenİlacUretimTarihi, GelenİlacTuketimTarihi=@GelenİlacTuketimTarihi, 
GelenİlacAlinanFirma=@GelenİlacAlinanFirma, GelenİlacSatilanFirma=@GelenİlacSatilanFirma
where GelenİlacNo=@GelenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_GeriGelenİlacEkle]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_GeriGelenİlacEkle]
@GeriGelenİlacAdi varchar(50),
@GeriGelenİlacBarkodNo int,
@GeriGelenİlacUretimTarihi datetime,
@GeriGelenİlacTuketimTarihi datetime,
@GeriGelenİlacSatilanFirmaAdi varchar(50)

as
insert into İlac_GeriGelenİlac(GeriGelenİlacAdi,GeriGelenİlacBarkodNo,GeriGelenİlacUretimTarihi, GeriGelenİlacTuketimTarihi, GeriGelenİlacSatilanFirmaAdi)
values(@GeriGelenİlacAdi,@GeriGelenİlacBarkodNo,@GeriGelenİlacUretimTarihi,@GeriGelenİlacTuketimTarihi,@GeriGelenİlacSatilanFirmaAdi)
GO
/****** Object:  StoredProcedure [dbo].[İlac_GeriGelenİlacListele]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_GeriGelenİlacListele]
as begin
select*from İlac_GeriGelenİlac
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_GeriGelenİlacSil]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_GeriGelenİlacSil]
@GeriGelenİlacNo int

as begin
delete from İlac_GeriGelenİlac where GeriGelenİlacNo=@GeriGelenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_GeriGelenİlacYenile]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[İlac_GeriGelenİlacYenile]
@GeriGelenİlacNo int,
@GeriGelenİlacAdi varchar(50),
@GeriGelenİlacBarkodNo int,
@GeriGelenİlacUretimTarihi datetime,
@GeriGelenİlacTuketimTarihi datetime,
@GeriGelenİlacSatilanFirmaAdi varchar(50)

as begin
update İlac_GeriGelenİlac set GeriGelenİlacAdi=@GeriGelenİlacAdi, GeriGelenİlacBarkodNo=@GeriGelenİlacBarkodNo, GeriGelenİlacUretimTarihi=@GeriGelenİlacUretimTarihi, 
GeriGelenİlacTuketimTarihi=@GeriGelenİlacTuketimTarihi, GeriGelenİlacSatilanFirmaAdi=@GeriGelenİlacSatilanFirmaAdi
where GeriGelenİlacNo=@GeriGelenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_İadeEdilenİlacEkle]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_İadeEdilenİlacEkle]
@İadeEdilenİlacAdi varchar(50),
@İadeEdilenİlacBarkodNo int,
@İadeEdilenİlacUretimTarihi datetime,
@İadeEdilenİlacTuketimTarihi datetime,
@İadeEdilenİlacAlinanFirmaAdi varchar(50)

as
insert into İlac_İadeEdilenİlac(İadeEdilenİlacAdi,İadeEdilenİlacBarkodNo,İadeEdilenİlacUretimTarihi, İadeEdilenİlacTuketimTarihi, İadeEdilenİlacAlinanFirmaAdi)
values(@İadeEdilenİlacAdi,@İadeEdilenİlacBarkodNo,@İadeEdilenİlacUretimTarihi,@İadeEdilenİlacTuketimTarihi,@İadeEdilenİlacAlinanFirmaAdi)
GO
/****** Object:  StoredProcedure [dbo].[İlac_İadeEdilenİlacListele]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_İadeEdilenİlacListele]
as begin
select*from İlac_İadeEdilenİlac
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_İadeEdilenİlacSil]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_İadeEdilenİlacSil]
@İadeEdilenİlacNo int

as begin
delete from İlac_İadeEdilenİlac where İadeEdilenİlacNo=@İadeEdilenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_İadeEdilenİlacYenile]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_İadeEdilenİlacYenile]
@İadeEdilenİlacNo int,
@İadeEdilenİlacAdi varchar(50),
@İadeEdilenİlacBarkodNo int,
@İadeEdilenİlacUretimTarihi datetime,
@İadeEdilenİlacTuketimTarihi datetime,
@İadeEdilenİlacAlinanFirmaAdi varchar(50)

as begin
update İlac_İadeEdilenİlac set İadeEdilenİlacAdi=@İadeEdilenİlacAdi, İadeEdilenİlacBarkodNo=@İadeEdilenİlacBarkodNo, İadeEdilenİlacUretimTarihi=@İadeEdilenİlacUretimTarihi, 
İadeEdilenİlacTuketimTarihi=@İadeEdilenİlacTuketimTarihi, İadeEdilenİlacAlinanFirmaAdi=@İadeEdilenİlacAlinanFirmaAdi
where İadeEdilenİlacNo=@İadeEdilenİlacNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_Raporlafirma]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlac_Raporlafirma]


@FirmaAdi varchar(50)

as begin 
select * from İlac_Firma where  FirmaAdi=@FirmaAdi
end
GO
/****** Object:  StoredProcedure [dbo].[İlac_Tuketimtarihinegoresirala]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[İlac_Tuketimtarihinegoresirala]
as begin
select * from İlac_Gelenİlac order by GelenİlacTuketimTarihi asc
end
GO
/****** Object:  StoredProcedure [dbo].[İlacFirmaEkle]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlacFirmaEkle]
@FirmaAdi varchar(50),
@FirmaSorumlusu varchar(50),
@BorcDurumu money

as
insert into İlac_Firma(FirmaAdi,FirmaSorumlusu,BorcDurumu)
values(@FirmaAdi, @FirmaSorumlusu, @BorcDurumu)
GO
/****** Object:  StoredProcedure [dbo].[İlacFirmaListele]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlacFirmaListele]
as begin
select*from İlac_Firma
end
GO
/****** Object:  StoredProcedure [dbo].[İlacFirmaSil]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlacFirmaSil]
@FirmaNo int

as begin
delete from İlac_Firma where FirmaNo=@FirmaNo
end
GO
/****** Object:  StoredProcedure [dbo].[İlacFirmaYenile]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[İlacFirmaYenile]
@FirmaNo int,
@FirmaAdi varchar(50),
@FirmaSorumlusu varchar(50),
@BorcDurumu money
as begin
update İlac_Firma set FirmaAdi=@FirmaAdi, FirmaSorumlusu=@FirmaSorumlusu, BorcDurumu=@BorcDurumu
where FirmaNo=@FirmaNo
end
GO
/****** Object:  StoredProcedure [dbo].[KGirisİlacDeposu]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KGirisİlacDeposu]
(
@KullaniciAdi varchar(50),
@Sifre varchar(50)
)
as begin 
select * from [dbo].[KullaniciKayit] where KullaniciAdi=@KullaniciAdi and Sifre=@Sifre
end
GO
/****** Object:  StoredProcedure [dbo].[KKayitİlacDeposu]    Script Date: 7.12.2022 23:54:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[KKayitİlacDeposu]
(
@KullaniciAdi varchar(50),
@Sifre varchar(50),
@Email varchar(50),
@Telefon varchar(50)
)
as begin
insert into [dbo].[KullaniciKayit]
(KullaniciAdi, Sifre, Email, Telefon) values (@KullaniciAdi, @Sifre, @Email, @Telefon)
end
GO
USE [master]
GO
ALTER DATABASE [İlacDeposu] SET  READ_WRITE 
GO
