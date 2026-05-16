CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN
    UPDATE dp
    SET dp.[ProductName] = sp.[ProductName],
        dp.[CategoryName] = sp.[CategoryName],
        dp.[SupplierName] = sp.[SupplierName],
        dp.[UnitPrice] = sp.[UnitPrice]
    FROM [dbo].[DimProduct] dp
    INNER JOIN [staging].[product] sp ON dp.[ProductID] = sp.[ProductID];

    INSERT INTO [dbo].[DimProduct] ([ProductID], [ProductName], [CategoryName], [SupplierName], [UnitPrice])
    SELECT sp.[ProductID], sp.[ProductName], sp.[CategoryName], sp.[SupplierName], sp.[UnitPrice]
    FROM [staging].[product] sp
    LEFT JOIN [dbo].[DimProduct] dp ON sp.[ProductID] = dp.[ProductID]
    WHERE dp.[ProductID] IS NULL;
END
GO