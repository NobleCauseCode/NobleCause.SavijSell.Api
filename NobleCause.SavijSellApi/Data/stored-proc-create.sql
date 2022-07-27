USE [SavijSell]
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_UpdateVerification]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Users_UpdateVerification]
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_Login]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Users_Login]
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_Insert]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Users_Insert]
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_GetByVerification]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Users_GetByVerification]
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_GetByEmail]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Users_GetByEmail]
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_Get]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Users_Get]
GO
/****** Object:  StoredProcedure [dbo].[stp_Items_Get_ByUser]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Items_Get_ByUser]
GO
/****** Object:  StoredProcedure [dbo].[stp_Items_Get]    Script Date: 7/26/2022 10:23:24 PM ******/
DROP PROCEDURE IF EXISTS [dbo].[stp_Items_Get]
GO
/****** Object:  StoredProcedure [dbo].[stp_Items_Get]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  PROCEDURE [dbo].[stp_Items_Get]
AS
/* ****************************************************************************
Change History
*******************************************************************************
DATE        CHANGED BY      REASON			DESCRIPTION
2021-10-09	Savij Coder		Script Created	Gets all items (will change later)
*******************************************************************************
*/
BEGIN
	BEGIN TRY
		SET NOCOUNT ON;
		SELECT	i.ItemId AS Id
				,i.UserId
				,i.Title
				,i.[Description]
				,i.[Image]
				,i.PostalCode AS [Location]
				,i.AskingPrice AS Price
				,i.CreatedDate
		FROM	Items i WITH (NOLOCK)
		WHERE	i.IsActive = 1
				AND i.IsSold = 0
     
	END TRY
	BEGIN CATCH
 
	DECLARE @Error_Message VARCHAR(5000)
	DECLARE @Error_Severity INT
	DECLARE @Error_State INT
 
	SELECT @Error_Message = ERROR_MESSAGE()
	SELECT @Error_Severity = ERROR_SEVERITY()
	SELECT @Error_State = ERROR_STATE()
 
	RAISERROR (@Error_Message, @Error_Severity, @Error_State)
 
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Items_Get_ByUser]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[stp_Items_Get_ByUser]
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
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_Get]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stp_Users_Get]
	@UserId		INT
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT UserId, FirstName, LastName, Email, PostalCode, UserName, Active AS IsActive, IsConfirmed, CreatedDate, ModifiedDate
	FROM Users
	WHERE UserId = @UserId
	
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_GetByEmail]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stp_Users_GetByEmail]
	@Email		VARCHAR(255)
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT TOP 1 UserId, FirstName, LastName, Email, Password, PostalCode, UserName, Active AS IsActive, IsConfirmed, CreatedDate, ModifiedDate
	FROM Users
	WHERE Email = @Email
	
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_GetByVerification]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_GetByVerification]    Script Date: 7/4/2022 5:07:56 PM ******/

CREATE PROCEDURE [dbo].[stp_Users_GetByVerification]
	@VerificationData VARCHAR(50)
	
AS
BEGIN
	DECLARE @UserId INT

	SET NOCOUNT ON;
	
	SELECT @UserId = u.UserId		
	FROM Users u	
	WHERE u.VerificationData = @VerificationData
		AND u.VerificationData IS NOT NULL
		AND u.IsConfirmed = 0
	
	IF @UserId IS NOT NULL
		BEGIN
			UPDATE Users
			SET VerificationData = NULL,
			IsConfirmed = 1
			WHERE UserId = @UserId
		END

	SELECT @UserId AS UserId
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_Insert]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stp_Users_Insert]
	@FirstName		VARCHAR(50)
	,@LastName		VARCHAR(50)
	,@Email			VARCHAR(255)
	,@Password		VARCHAR(MAX)
	,@PostalCode	VARCHAR(25)
	,@UserName		VARCHAR(15)
	,@UserId		INT OUTPUT
	
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO Users
	(FirstName, LastName, Email, Password, PostalCode, UserName, Active, IsConfirmed, CreatedDate, ModifiedDate)
	VALUES
	(
		@FirstName
		,@LastName
		,@Email
		,@Password
		,@PostalCode
		,@UserName
		,1
		,0
		,GetDate()
		,GetDate()
	)
	 SELECT @UserId = SCOPE_IDENTITY()
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_Login]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[stp_Users_Login]
	@Email		VARCHAR(255)
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT [UserId]
      ,[FirstName]
      ,[LastName]
      ,[Email]
	  ,[Password]
      ,[PostalCode]
      ,[UserName]
      ,[Picture]
      ,[Active] AS IsActive
      ,[IsConfirmed]
      ,[CreatedDate]
      ,[ModifiedDate]
	FROM Users
	WHERE Email = @Email
	
END
GO
/****** Object:  StoredProcedure [dbo].[stp_Users_UpdateVerification]    Script Date: 7/26/2022 10:23:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeff Noble
-- Create date: 06-29-2022
-- Description:	
-- =============================================
CREATE PROCEDURE [dbo].[stp_Users_UpdateVerification] 
	-- Add the parameters for the stored procedure here
	@UserId INT, 
	@VerificationData VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	UPDATE dbo.Users
		SET Users.VerificationData = @VerificationData
	WHERE
		Users.UserId = @UserId
END
GO
