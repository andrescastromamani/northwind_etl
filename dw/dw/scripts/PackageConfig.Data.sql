/*
--------------------------------------------------------------------------------------
INICIALIZACIÓN DE TABLA DE CONTROL - NORTHWIND DW
--------------------------------------------------------------------------------------
*/

-- Para Clientes
IF NOT EXISTS(SELECT 1 FROM [dbo].[PackageConfig] WHERE [TableName] = 'DimCustomer')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('DimCustomer', 0)
END
GO

-- Para Productos
IF NOT EXISTS(SELECT 1 FROM [dbo].[PackageConfig] WHERE [TableName] = 'DimProduct')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('DimProduct', 0)
END
GO

-- Para Empleados
IF NOT EXISTS(SELECT 1 FROM [dbo].[PackageConfig] WHERE [TableName] = 'DimEmployee')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('DimEmployee', 0)
END
GO

-- Para Transportistas (Shippers)
IF NOT EXISTS(SELECT 1 FROM [dbo].[PackageConfig] WHERE [TableName] = 'DimShipper')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('DimShipper', 0)
END
GO

-- Para la tabla de Hechos (Ventas)
IF NOT EXISTS(SELECT 1 FROM [dbo].[PackageConfig] WHERE [TableName] = 'FactSales')
BEGIN
    INSERT [dbo].[PackageConfig] ([TableName], [LastRowVersion]) VALUES ('FactSales', 0)
END
GO