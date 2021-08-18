USE [SavijSell]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserItems]') AND type in (N'U'))
ALTER TABLE [dbo].[UserItems] DROP CONSTRAINT IF EXISTS [FK_UserItems_Users]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserItems]') AND type in (N'U'))
ALTER TABLE [dbo].[UserItems] DROP CONSTRAINT IF EXISTS [FK_UserItems_Items]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemTags]') AND type in (N'U'))
ALTER TABLE [dbo].[ItemTags] DROP CONSTRAINT IF EXISTS [FK_ItemTags_Tags]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ItemTags]') AND type in (N'U'))
ALTER TABLE [dbo].[ItemTags] DROP CONSTRAINT IF EXISTS [FK_ItemTags_Items]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
ALTER TABLE [dbo].[Items] DROP CONSTRAINT IF EXISTS [FK_Users_Items]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [DF_Users_ModifiedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [DF_Users_CreatedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [DF_Users_IsConfirmed]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
ALTER TABLE [dbo].[Users] DROP CONSTRAINT IF EXISTS [DF_Users_Active]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserItems]') AND type in (N'U'))
ALTER TABLE [dbo].[UserItems] DROP CONSTRAINT IF EXISTS [DF_UserItems_CreatedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tags]') AND type in (N'U'))
ALTER TABLE [dbo].[Tags] DROP CONSTRAINT IF EXISTS [DF_Tags_CreatedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
ALTER TABLE [dbo].[Items] DROP CONSTRAINT IF EXISTS [DF_Items_ModifiedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
ALTER TABLE [dbo].[Items] DROP CONSTRAINT IF EXISTS [DF_Items_CreatedDate]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
ALTER TABLE [dbo].[Items] DROP CONSTRAINT IF EXISTS [DF_Items_IsSold]
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Items]') AND type in (N'U'))
ALTER TABLE [dbo].[Items] DROP CONSTRAINT IF EXISTS [DF_Items_IsActive]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/17/2021 10:17:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserItems]    Script Date: 8/17/2021 10:17:59 PM ******/
DROP TABLE IF EXISTS [dbo].[UserItems]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8/17/2021 10:17:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Tags]
GO
/****** Object:  Table [dbo].[ItemTags]    Script Date: 8/17/2021 10:17:59 PM ******/
DROP TABLE IF EXISTS [dbo].[ItemTags]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 8/17/2021 10:17:59 PM ******/
DROP TABLE IF EXISTS [dbo].[Items]
GO
USE [master]
GO
/****** Object:  Database [SavijSell]    Script Date: 8/17/2021 10:17:59 PM ******/
DROP DATABASE IF EXISTS [SavijSell]
GO
/****** Object:  Database [SavijSell]    Script Date: 8/17/2021 10:17:59 PM ******/
CREATE DATABASE [SavijSell]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SavijSell', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SavijSell.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SavijSell_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SavijSell_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SavijSell] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SavijSell].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SavijSell] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SavijSell] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SavijSell] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SavijSell] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SavijSell] SET ARITHABORT OFF 
GO
ALTER DATABASE [SavijSell] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SavijSell] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SavijSell] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SavijSell] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SavijSell] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SavijSell] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SavijSell] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SavijSell] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SavijSell] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SavijSell] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SavijSell] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SavijSell] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SavijSell] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SavijSell] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SavijSell] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SavijSell] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SavijSell] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SavijSell] SET RECOVERY FULL 
GO
ALTER DATABASE [SavijSell] SET  MULTI_USER 
GO
ALTER DATABASE [SavijSell] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SavijSell] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SavijSell] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SavijSell] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SavijSell] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'SavijSell', N'ON'
GO
ALTER DATABASE [SavijSell] SET QUERY_STORE = OFF
GO
USE [SavijSell]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 8/17/2021 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [varchar](25) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Image] [varchar](255) NOT NULL,
	[PostalCode] [varchar](25) NOT NULL,
	[AskingPrice] [money] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsSold] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ItemTags]    Script Date: 8/17/2021 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemTags](
	[ItemTagId] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[TagId] [int] NOT NULL,
 CONSTRAINT [PK_ItemTags] PRIMARY KEY CLUSTERED 
(
	[ItemTagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 8/17/2021 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [int] IDENTITY(1,1) NOT NULL,
	[TagName] [varchar](255) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserItems]    Script Date: 8/17/2021 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserItems](
	[UserItemId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ItemId] [int] NOT NULL,
	[PurchasePrice] [money] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserItems] PRIMARY KEY CLUSTERED 
(
	[UserItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/17/2021 10:17:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[Password] [varchar](max) NOT NULL,
	[PostalCode] [varchar](25) NOT NULL,
	[UserName] [varchar](15) NOT NULL,
	[Picture] [varchar](255) NULL,
	[Active] [bit] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_IsSold]  DEFAULT ((0)) FOR [IsSold]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Items] ADD  CONSTRAINT [DF_Items_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Tags] ADD  CONSTRAINT [DF_Tags_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserItems] ADD  CONSTRAINT [DF_UserItems_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_Active]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsConfirmed]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Users_Items] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Users_Items]
GO
ALTER TABLE [dbo].[ItemTags]  WITH CHECK ADD  CONSTRAINT [FK_ItemTags_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[ItemTags] CHECK CONSTRAINT [FK_ItemTags_Items]
GO
ALTER TABLE [dbo].[ItemTags]  WITH CHECK ADD  CONSTRAINT [FK_ItemTags_Tags] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
GO
ALTER TABLE [dbo].[ItemTags] CHECK CONSTRAINT [FK_ItemTags_Tags]
GO
ALTER TABLE [dbo].[UserItems]  WITH CHECK ADD  CONSTRAINT [FK_UserItems_Items] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Items] ([ItemId])
GO
ALTER TABLE [dbo].[UserItems] CHECK CONSTRAINT [FK_UserItems_Items]
GO
ALTER TABLE [dbo].[UserItems]  WITH CHECK ADD  CONSTRAINT [FK_UserItems_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserItems] CHECK CONSTRAINT [FK_UserItems_Users]
GO
USE [master]
GO
ALTER DATABASE [SavijSell] SET  READ_WRITE 
GO
