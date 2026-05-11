CREATE PROCEDURE [dbo].[GetEmployeeChangesByRowVersion]
	@startRow BIGINT 
   ,@endRow  BIGINT 
AS
BEGIN
	SELECT [EmployeeID]
          ,[LastName]
          ,[FirstName]
          ,[Title]
          ,[TitleOfCourtesy]
          ,[BirthDate]
          ,[HireDate]
          ,[Address]
          ,[City]
          ,[Region]
          ,[PostalCode]
          ,[Country]
          ,[HomePhone]
          ,[Extension]
          ,[Photo]
          ,[Notes]
          ,[ReportsTo]
          ,[PhotoPath]
          ,[rowversion]
      FROM [dbo].[Employees]
      WHERE [rowversion] > CONVERT(ROWVERSION,@startRow) 
	  AND [rowversion] <= CONVERT(ROWVERSION,@endRow);
END
GO