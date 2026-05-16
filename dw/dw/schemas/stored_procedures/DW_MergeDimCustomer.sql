CREATE PROCEDURE [dbo].[DW_MergeDimCustomer]
AS
BEGIN
    -- 1. Actualizar registros existentes
    UPDATE dc
    SET dc.[CompanyName] = sc.[CompanyName],
        dc.[City] = sc.[City],
        dc.[Country] = sc.[Country]
    FROM [dbo].[DimCustomer] dc
    INNER JOIN [staging].[customer] sc ON dc.[CustomerID] = sc.[CustomerID];

    -- 2. Insertar nuevos registros
    INSERT INTO [dbo].[DimCustomer] ([CustomerID], [CompanyName], [City], [Country])
    SELECT sc.[CustomerID], sc.[CompanyName], sc.[City], sc.[Country]
    FROM [staging].[customer] sc
    LEFT JOIN [dbo].[DimCustomer] dc ON sc.[CustomerID] = dc.[CustomerID]
    WHERE dc.[CustomerID] IS NULL;
END
GO