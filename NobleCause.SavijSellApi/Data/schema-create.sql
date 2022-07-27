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
/****** Object:  Table [dbo].[Users]    Script Date: 7/26/2022 10:25:13 PM ******/
DROP TABLE IF EXISTS [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserItems]    Script Date: 7/26/2022 10:25:13 PM ******/
DROP TABLE IF EXISTS [dbo].[UserItems]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 7/26/2022 10:25:13 PM ******/
DROP TABLE IF EXISTS [dbo].[Tags]
GO
/****** Object:  Table [dbo].[ItemTags]    Script Date: 7/26/2022 10:25:13 PM ******/
DROP TABLE IF EXISTS [dbo].[ItemTags]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 7/26/2022 10:25:13 PM ******/
DROP TABLE IF EXISTS [dbo].[Items]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 7/26/2022 10:25:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[ItemId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Title] [varchar](50) NOT NULL,
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
/****** Object:  Table [dbo].[ItemTags]    Script Date: 7/26/2022 10:25:13 PM ******/
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
/****** Object:  Table [dbo].[Tags]    Script Date: 7/26/2022 10:25:13 PM ******/
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
/****** Object:  Table [dbo].[UserItems]    Script Date: 7/26/2022 10:25:13 PM ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 7/26/2022 10:25:13 PM ******/
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
	[VerificationData] [varchar](50) NULL,
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
