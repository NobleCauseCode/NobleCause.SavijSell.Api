USE [SavijSell]
GO
DELETE FROM [dbo].[ItemTags]
GO
DELETE FROM [dbo].[Tags]
GO
DELETE FROM [dbo].[UserItems]
GO
DELETE FROM [dbo].[Items]
GO
DELETE FROM [dbo].[Users]
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [PostalCode], [UserName], [Picture], [Active], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (1, N'Savij', N'Coder', N'savij.coder@sharklasers.com', N'Password123!', N'27502', N'SavijCoder', NULL, 1, 1, CAST(N'2021-08-22T13:10:48.290' AS DateTime), CAST(N'2021-08-22T13:10:48.290' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [PostalCode], [UserName], [Picture], [Active], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (2, N'Samantha', N'Carter', N'samcartersavijsell@sharklasers.com', N'Password234!', N'80914', N'ColonelCarter', NULL, 1, 1, CAST(N'2021-08-22T13:14:26.573' AS DateTime), CAST(N'2021-08-22T13:14:26.573' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [PostalCode], [UserName], [Picture], [Active], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (4, N'Unconfirmed', N'User', N'unconfirmedsavijselluser@sharklasers.com', N'Password345!', N'33073', N'UnconfirmedUser', NULL, 1, 0, CAST(N'2021-08-22T13:15:40.830' AS DateTime), CAST(N'2021-08-22T13:15:40.830' AS DateTime))
GO
INSERT [dbo].[Users] ([UserId], [FirstName], [LastName], [Email], [Password], [PostalCode], [UserName], [Picture], [Active], [IsConfirmed], [CreatedDate], [ModifiedDate]) VALUES (5, N'Inactive', N'User', N'inactiveusersavijsell@sharklasers.com', N'Password456!', N'14618', N'InactiveUser', NULL, 0, 1, CAST(N'2021-08-22T13:17:04.143' AS DateTime), CAST(N'2021-08-22T13:17:04.143' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Items] ON 
GO
INSERT [dbo].[Items] ([ItemId], [UserId], [Title], [Description], [Image], [PostalCode], [AskingPrice], [IsActive], [IsSold], [CreatedDate], [ModifiedDate]) VALUES (2, 1, N'ESP Guitar', N'Blue Custom ESP mKII. In excellent condition and ready for a new home', N'/images/guitar1.jpg', N'27502', 1000.0000, 1, 0, CAST(N'2021-08-22T13:20:36.307' AS DateTime), CAST(N'2021-08-22T13:20:36.307' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [UserId], [Title], [Description], [Image], [PostalCode], [AskingPrice], [IsActive], [IsSold], [CreatedDate], [ModifiedDate]) VALUES (3, 1, N'Macbook Pro', N'Like New MBP with touchbar. Great laptop for any need', N'/images/laptop1.png', N'27502', 999.5000, 1, 0, CAST(N'2021-08-22T13:21:51.553' AS DateTime), CAST(N'2021-08-22T13:21:51.553' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [UserId], [Title], [Description], [Image], [PostalCode], [AskingPrice], [IsActive], [IsSold], [CreatedDate], [ModifiedDate]) VALUES (4, 1, N'Dan Marino Football', N'Autographed by Dan the man himself! True collectors item, one of a kind.', N'/images/football1.png', N'27502', 450.0000, 0, 1, CAST(N'2021-08-22T13:23:12.860' AS DateTime), CAST(N'2021-08-22T13:23:12.860' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [UserId], [Title], [Description], [Image], [PostalCode], [AskingPrice], [IsActive], [IsSold], [CreatedDate], [ModifiedDate]) VALUES (5, 2, N'Ancient Artifact', N'I have no idea what this does, it comes from aliens and is most likely hazerdous. I dont want it AT ALL!', N'/images/artifact.png', N'80914', 50.0000, 1, 0, CAST(N'2021-08-22T13:25:13.900' AS DateTime), CAST(N'2021-08-22T13:25:13.900' AS DateTime))
GO
INSERT [dbo].[Items] ([ItemId], [UserId], [Title], [Description], [Image], [PostalCode], [AskingPrice], [IsActive], [IsSold], [CreatedDate], [ModifiedDate]) VALUES (6, 2, N'DHD Dialing Device - Parts', N'This is a broken DHD, good for parts or home decor.', N'/images/dhd1.png', N'80914', 100.0000, 0, 1, CAST(N'2021-08-22T13:27:28.533' AS DateTime), CAST(N'2021-08-22T13:27:28.533' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Items] OFF
GO
SET IDENTITY_INSERT [dbo].[UserItems] ON 
GO
INSERT [dbo].[UserItems] ([UserItemId], [UserId], [ItemId], [PurchasePrice], [CreatedDate]) VALUES (1, 2, 4, 270.0000, CAST(N'2021-08-22T13:31:54.557' AS DateTime))
GO
INSERT [dbo].[UserItems] ([UserItemId], [UserId], [ItemId], [PurchasePrice], [CreatedDate]) VALUES (2, 1, 6, 85.0000, CAST(N'2021-08-22T13:32:37.017' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[UserItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Tags] ON 
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (1, N'Musical Instruments', CAST(N'2021-08-22T13:17:47.160' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (2, N'Computer Software', CAST(N'2021-08-22T13:17:55.973' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (3, N'Computer Hardware', CAST(N'2021-08-22T13:18:00.923' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (4, N'Sports Memorabilia', CAST(N'2021-08-22T13:18:11.580' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (5, N'Books', CAST(N'2021-08-22T13:18:16.047' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (6, N'Electronics', CAST(N'2021-08-22T13:18:22.153' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (7, N'Sports', CAST(N'2021-08-22T13:18:25.373' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (8, N'Fitness', CAST(N'2021-08-22T13:18:34.793' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (9, N'Health', CAST(N'2021-08-22T13:18:39.463' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (10, N'Educational', CAST(N'2021-08-22T13:18:43.513' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (11, N'Computer Science', CAST(N'2021-08-22T13:18:51.837' AS DateTime))
GO
INSERT [dbo].[Tags] ([TagId], [TagName], [CreatedDate]) VALUES (12, N'Dangerous', CAST(N'2021-08-22T13:23:43.430' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Tags] OFF
GO
SET IDENTITY_INSERT [dbo].[ItemTags] ON 
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (2, 2, 1)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (3, 2, 6)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (4, 3, 2)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (5, 3, 3)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (6, 3, 6)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (7, 3, 10)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (8, 3, 11)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (9, 4, 4)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (10, 5, 6)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (11, 5, 11)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (12, 5, 12)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (13, 6, 6)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (14, 6, 11)
GO
INSERT [dbo].[ItemTags] ([ItemTagId], [ItemId], [TagId]) VALUES (15, 6, 12)
GO
SET IDENTITY_INSERT [dbo].[ItemTags] OFF
GO
