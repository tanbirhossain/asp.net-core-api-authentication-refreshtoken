USE [master]
GO
/****** Object:  Database [AngularCrudDB]    Script Date: 04/06/2019 15:59:38 ******/
CREATE DATABASE [AngularCrudDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AngularCrudDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AngularCrudDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AngularCrudDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\AngularCrudDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [AngularCrudDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AngularCrudDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO 
ALTER DATABASE [AngularCrudDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AngularCrudDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AngularCrudDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AngularCrudDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AngularCrudDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AngularCrudDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AngularCrudDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AngularCrudDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AngularCrudDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AngularCrudDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AngularCrudDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AngularCrudDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AngularCrudDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AngularCrudDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AngularCrudDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AngularCrudDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AngularCrudDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AngularCrudDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AngularCrudDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AngularCrudDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AngularCrudDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AngularCrudDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AngularCrudDB] SET RECOVERY FULL 
GO
ALTER DATABASE [AngularCrudDB] SET  MULTI_USER 
GO
ALTER DATABASE [AngularCrudDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AngularCrudDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AngularCrudDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AngularCrudDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AngularCrudDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AngularCrudDB', N'ON'
GO
ALTER DATABASE [AngularCrudDB] SET QUERY_STORE = OFF
GO
USE [AngularCrudDB]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 04/06/2019 15:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[Gender] [varchar](50) NULL,
	[DOB] [datetime] NULL,
	[Country] [varchar](50) NULL,
	[City] [varchar](50) NULL,
	[Image] [varchar](500) NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 04/06/2019 15:59:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NULL,
	[Password] [varchar](500) NULL,
	[AccessToken] [nvarchar](max) NULL,
	[RefreshToken] [nvarchar](max) NULL,
	[IsActiveAccessToken] [bit] NULL,
	[IsActiveRefreshToken] [bit] NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (7, N'ds', N'ds', NULL, N'sd', N'ds', NULL, NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (12, N'sxsad', N'dsa', NULL, N'dsa', N'sad', N'', NULL)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (16, N'Ovi3', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (25, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (26, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (27, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (28, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (29, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (30, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (31, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (32, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (33, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (34, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (35, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
INSERT [dbo].[Employee] ([Id], [Name], [Gender], [DOB], [Country], [City], [Image], [IsActive]) VALUES (36, N'Ovi366', N'male', CAST(N'2019-05-30T00:00:00.000' AS DateTime), N'bangladesh', N'dhaka', NULL, 1)
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Username], [Password], [AccessToken], [RefreshToken], [IsActiveAccessToken], [IsActiveRefreshToken], [Name]) VALUES (0, N's', N's', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJzIiwiaXNzIjoibXktaWRlbnRpdHkiLCJpYXQiOjE1NTk2NTU5NDIsImV4cCI6MTU1OTY1NjI0MiwidW5pcXVlX25hbWUiOiJzIn0.lvqlC_22RmJhW1f-OdgI5QPF2cy2uUXg1VZeiOlkV74', N'AQAAAAEAACcQAAAAEOuUI3LKEJHnKBNQsTsnTyWqgKLVM9nDl0LngvQHaHpSAex3V7chfl9VXct8Urb41Q', 1, 1, NULL)
INSERT [dbo].[User] ([Id], [Username], [Password], [AccessToken], [RefreshToken], [IsActiveAccessToken], [IsActiveRefreshToken], [Name]) VALUES (1, N'ty', N'tr', NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Username], [Password], [AccessToken], [RefreshToken], [IsActiveAccessToken], [IsActiveRefreshToken], [Name]) VALUES (3, N'ovi', N'ovi', N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIzIiwiaXNzIjoibXktaWRlbnRpdHkiLCJpYXQiOjE1NTk2NjI2ODEsImV4cCI6MTU1OTY2Mjk4MSwidW5pcXVlX25hbWUiOiIzIn0.SsJfon6xctXrGEQdvnNeAC4Sz92fscAv0dpHX0Mu16Y', N'AQAAAAEAACcQAAAAEOYGVApVJr6Z1ID02cLmSyhd42z1UPeMP62VI2DqDmGW2HASBOH6zUWE2AnlMIlqw', 0, 0, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
USE [master]
GO
ALTER DATABASE [AngularCrudDB] SET  READ_WRITE 
GO
