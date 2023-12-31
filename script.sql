USE [master]
GO
/****** Object:  Database [FlightBookApp]    Script Date: 12.09.2023 14:51:29 ******/
CREATE DATABASE [FlightBookApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlightBookApp', FILENAME = N'C:\Users\PROTEK\FlightBookApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FlightBookApp_log', FILENAME = N'C:\Users\PROTEK\FlightBookApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FlightBookApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlightBookApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlightBookApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlightBookApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlightBookApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlightBookApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlightBookApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlightBookApp] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FlightBookApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlightBookApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlightBookApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlightBookApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlightBookApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlightBookApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlightBookApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlightBookApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlightBookApp] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlightBookApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlightBookApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlightBookApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlightBookApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlightBookApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlightBookApp] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FlightBookApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlightBookApp] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FlightBookApp] SET  MULTI_USER 
GO
ALTER DATABASE [FlightBookApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlightBookApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlightBookApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlightBookApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FlightBookApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FlightBookApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FlightBookApp] SET QUERY_STORE = OFF
GO
USE [FlightBookApp]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12.09.2023 14:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[airports]    Script Date: 12.09.2023 14:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[airports](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[airportName] [nvarchar](max) NULL,
	[cityName] [nvarchar](max) NULL,
	[shortName] [nvarchar](max) NULL,
 CONSTRAINT [PK_airports] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[books]    Script Date: 12.09.2023 14:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[bookCode] [nvarchar](max) NULL,
	[flightId] [int] NOT NULL,
	[customerName] [nvarchar](max) NULL,
	[customerSurname] [nvarchar](max) NULL,
	[customerPhone] [nvarchar](max) NULL,
	[customerMail] [nvarchar](max) NULL,
	[CreatedTime] [datetime] NOT NULL,
 CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[flights]    Script Date: 12.09.2023 14:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[flights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[planeId] [int] NOT NULL,
	[airportIdFromWhere] [int] NOT NULL,
	[airportIdToWhere] [int] NOT NULL,
	[flightStartDate] [datetime] NOT NULL,
	[flightEndDate] [datetime] NOT NULL,
	[Price] [int] NOT NULL,
 CONSTRAINT [PK_flights] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[planes]    Script Date: 12.09.2023 14:51:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[planes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[planeCode] [nvarchar](max) NULL,
	[planeName] [nvarchar](max) NULL,
	[planeCapacity] [nvarchar](max) NULL,
 CONSTRAINT [PK_planes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230911204636_initial', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[airports] ON 

INSERT [dbo].[airports] ([Id], [airportName], [cityName], [shortName]) VALUES (1, N'İstanbul Sabiha Gökçen Havaalanı', N'İstanbul', N'SAW')
INSERT [dbo].[airports] ([Id], [airportName], [cityName], [shortName]) VALUES (2, N'Ankara Esenboğa Havaalanı', N'Ankara', N'ESB')
INSERT [dbo].[airports] ([Id], [airportName], [cityName], [shortName]) VALUES (3, N'İzmir Adnan Menderes Havaalanı', N'İzmir', N'EDB')
INSERT [dbo].[airports] ([Id], [airportName], [cityName], [shortName]) VALUES (4, N'Bursa Yenişehir Havaalanı', N'Bursa', N'YEI')
SET IDENTITY_INSERT [dbo].[airports] OFF
GO
SET IDENTITY_INSERT [dbo].[books] ON 

INSERT [dbo].[books] ([Id], [bookCode], [flightId], [customerName], [customerSurname], [customerPhone], [customerMail], [CreatedTime]) VALUES (31, N'PC 26629.904781405309176', 1, N'Onur', N'Akçakale', N'05555555555', N'deneme@deneme.com', CAST(N'2023-09-12T11:11:09.573' AS DateTime))
INSERT [dbo].[books] ([Id], [bookCode], [flightId], [customerName], [customerSurname], [customerPhone], [customerMail], [CreatedTime]) VALUES (32, N'PC 26629.904781405309176', 5, N'Onur', N'Akçakale', N'05555555555', N'deneme@deneme.com', CAST(N'2023-09-12T11:11:09.580' AS DateTime))
SET IDENTITY_INSERT [dbo].[books] OFF
GO
SET IDENTITY_INSERT [dbo].[flights] ON 

INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (1, 1, 1, 2, CAST(N'2023-09-11T07:15:00.000' AS DateTime), CAST(N'2023-09-11T08:15:00.000' AS DateTime), 583)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (3, 2, 2, 1, CAST(N'2023-09-12T09:25:00.000' AS DateTime), CAST(N'2023-09-12T10:25:00.000' AS DateTime), 611)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (4, 3, 1, 2, CAST(N'2023-09-11T08:25:00.000' AS DateTime), CAST(N'2023-09-11T09:25:00.000' AS DateTime), 633)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (5, 4, 2, 1, CAST(N'2023-09-12T18:15:00.000' AS DateTime), CAST(N'2023-09-12T19:15:00.000' AS DateTime), 618)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (6, 5, 3, 4, CAST(N'2023-09-11T05:40:00.000' AS DateTime), CAST(N'2023-09-11T13:25:00.000' AS DateTime), 3105)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (7, 6, 3, 4, CAST(N'2023-09-11T03:45:00.000' AS DateTime), CAST(N'2023-09-11T13:25:00.000' AS DateTime), 3285)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (8, 7, 4, 3, CAST(N'2023-09-12T15:35:00.000' AS DateTime), CAST(N'2023-09-12T21:35:00.000' AS DateTime), 3044)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (9, 8, 1, 3, CAST(N'2023-09-11T19:05:00.000' AS DateTime), CAST(N'2023-09-11T20:15:00.000' AS DateTime), 1034)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (10, 9, 3, 1, CAST(N'2023-09-12T23:15:00.000' AS DateTime), CAST(N'2023-09-13T00:15:00.000' AS DateTime), 1036)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (11, 10, 3, 1, CAST(N'2023-09-12T22:35:00.000' AS DateTime), CAST(N'2023-09-12T23:40:00.000' AS DateTime), 1054)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (12, 11, 2, 3, CAST(N'2023-09-11T17:55:00.000' AS DateTime), CAST(N'2023-09-11T19:10:00.000' AS DateTime), 1138)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (13, 12, 2, 3, CAST(N'2023-09-11T20:50:00.000' AS DateTime), CAST(N'2023-09-11T00:10:00.000' AS DateTime), 2160)
INSERT [dbo].[flights] ([Id], [planeId], [airportIdFromWhere], [airportIdToWhere], [flightStartDate], [flightEndDate], [Price]) VALUES (14, 13, 3, 2, CAST(N'2023-09-12T06:15:00.000' AS DateTime), CAST(N'2023-09-12T07:25:00.000' AS DateTime), 1068)
SET IDENTITY_INSERT [dbo].[flights] OFF
GO
SET IDENTITY_INSERT [dbo].[planes] ON 

INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (1, N'PC 2662', N'Pegasus', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (2, N'PC 2663', N'Pegasus', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (3, N'TK 7240', N'Anadolujet', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (4, N'PC 2669', N'Pegasus', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (5, N'TK 7019', N'Anadolujet', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (6, N'TK 2355', N'Türk Hava Yolları', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (7, N'TK 7576', N'Anadolujet', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (8, N'PC 2218', N'Pegasus', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (9, N'PC 2209', N'Pegasus', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (10, N'TK 7491', N'Anadolujet', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (11, N'PC 3167', N'Pegasus', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (12, N'TK 2175', N'Türk Hava Yolları', N'15 kg')
INSERT [dbo].[planes] ([Id], [planeCode], [planeName], [planeCapacity]) VALUES (13, N'PC 3160', N'Pegasus', N'15 kg')
SET IDENTITY_INSERT [dbo].[planes] OFF
GO
USE [master]
GO
ALTER DATABASE [FlightBookApp] SET  READ_WRITE 
GO
