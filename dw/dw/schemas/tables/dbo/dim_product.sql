CREATE TABLE [dbo].[DimProduct] (
    [ProductKey]   INT           IDENTITY (1, 1) NOT NULL,
    [ProductID]    INT           NOT NULL,
    [ProductName]  NVARCHAR (40) NOT NULL,
    [CategoryName] NVARCHAR (15) NULL,
    [SupplierName] NVARCHAR (40) NULL,
    [UnitPrice]    MONEY         NULL,
    PRIMARY KEY CLUSTERED ([ProductKey] ASC)
);

