USE [SavijSell]
GO
/****** Object:  StoredProcedure [dbo].[stp_Items_Get_ByUser]    Script Date: 8/22/2021 4:12:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[stp_Items_Get_ByUser]
	@userId INT
	
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT u.UserId
		,i.ItemId
		,i.Title
		,i.Description
		,i.Image
		,i.PostalCode
		,i.AskingPrice
		,i.IsActive
		,i.IsSold
		,i.CreatedDate
		,i.ModifiedDate
	FROM Users u
	INNER JOIN Items i
		ON u.UserId = i.UserId
	WHERE u.UserId = @userId
		AND i.IsActive = 1
		AND i.IsSold = 0
		AND u.Active = 1
END