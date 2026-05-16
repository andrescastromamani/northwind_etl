CREATE PROCEDURE [dbo].[DW_MergeFactSales]
AS
BEGIN
    -- En tablas de hechos suele ser mejor limpiar e insertar todo de nuevo si es una carga total
    -- o usar esta lógica para no duplicar órdenes:
    
    INSERT INTO [dbo].[FactSales] (
        [OrderID], [CustomerKey], [EmployeeKey], [ProductKey], [ShipperKey], 
        [DateKey], [UnitPrice], [Quantity], [Discount]
    )
    SELECT 
        s.[OrderID],
        dc.[CustomerKey],
        de.[EmployeeKey],
        dp.[ProductKey],
        dsh.[ShipperKey],
        CONVERT(INT, CONVERT(VARCHAR(8), s.[OrderDate], 112)) AS [DateKey],
        s.[UnitPrice],
        s.[Quantity],
        s.[Discount]
    FROM [staging].[sales] s
    INNER JOIN [dbo].[DimCustomer] dc ON s.[CustomerID] = dc.[CustomerID]
    INNER JOIN [dbo].[DimEmployee] de ON s.[EmployeeID] = de.[EmployeeID]
    INNER JOIN [dbo].[DimProduct] dp  ON s.[ProductID] = dp.[ProductID]
    INNER JOIN [dbo].[DimShipper] dsh ON s.[ShipperID] = dsh.[ShipperID]
    LEFT JOIN [dbo].[FactSales] fs ON s.[OrderID] = fs.[OrderID] AND dp.[ProductKey] = fs.[ProductKey]
    WHERE fs.[OrderID] IS NULL; -- Solo inserta si no existe la combinación Orden-Producto
END
GO
