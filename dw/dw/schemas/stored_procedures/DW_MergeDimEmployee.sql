CREATE PROCEDURE [dbo].[DW_MergeDimEmployee]
AS
BEGIN
    UPDATE de
    SET de.[LastName] = se.[LastName],
        de.[FirstName] = se.[FirstName],
        de.[Title] = se.[Title]
    FROM [dbo].[DimEmployee] de
    INNER JOIN [staging].[employee] se ON de.[EmployeeID] = se.[EmployeeID];

    INSERT INTO [dbo].[DimEmployee] ([EmployeeID], [LastName], [FirstName], [Title])
    SELECT se.[EmployeeID], se.[LastName], se.[FirstName], se.[Title]
    FROM [staging].[employee] se
    LEFT JOIN [dbo].[DimEmployee] de ON se.[EmployeeID] = de.[EmployeeID]
    WHERE de.[EmployeeID] IS NULL;
END
GO