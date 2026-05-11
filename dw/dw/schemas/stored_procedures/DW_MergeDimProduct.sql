CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN
    SET NOCOUNT ON;
    UPDATE dp
    SET ProductName = sc.ProductName,
        CategoryName = sc.CategoryName,
        SupplierName = sc.SupplierName,
        UnitPrice = sc.UnitPrice,
        Discontinued = sc.Discontinued
    FROM dbo.DIM_PRODUCT AS dp
    INNER JOIN staging.Product AS sc ON dp.ProductSK = sc.ProductSK;

END;
GO