CREATE PROCEDURE [dbo].[GetCustomerChangesByRowVersion]
	@startRow BIGINT 
   ,@endRow  BIGINT 
AS
BEGIN
	SELECT [CustomerID]
          ,[ContactName]
          ,[ContactTitle]
          ,[CompanyName]
          ,[Address]
          ,[City]
          ,[Region]
          ,[PostalCode]
          ,[Country]
          ,[Phone]
          ,[Fax]
          ,[rowversion]
      FROM [dbo].[Customers]
      WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow)
END
GO