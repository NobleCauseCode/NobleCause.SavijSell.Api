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
WHERE u.UserId = 1
	AND i.IsActive = 1
	AND i.IsSold = 0
	AND u.Active = 1