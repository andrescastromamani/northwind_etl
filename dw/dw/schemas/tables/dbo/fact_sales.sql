CREATE TABLE [dbo].[FactSales] (
    [SalesKey]    BIGINT   IDENTITY (1, 1) NOT NULL,
    [OrderID]     INT      NOT NULL,
    [CustomerKey] INT      NOT NULL,
    [EmployeeKey] INT      NOT NULL,
    [ProductKey]  INT      NOT NULL,
    [ShipperKey]  INT      NOT NULL,
    [DateKey]     INT      NOT NULL,
    [UnitPrice]   MONEY    NOT NULL,
    [Quantity]    SMALLINT NOT NULL,
    [Discount]    REAL     NOT NULL,
    [TotalAmount] AS       (CONVERT([money],([UnitPrice]*[Quantity])*((1)-[Discount]))),
    PRIMARY KEY CLUSTERED ([SalesKey] ASC),
    CONSTRAINT [FK_FactSales_DimCustomer] FOREIGN KEY ([CustomerKey]) REFERENCES [dbo].[DimCustomer] ([CustomerKey]),
    CONSTRAINT [FK_FactSales_DimDate] FOREIGN KEY ([DateKey]) REFERENCES [dbo].[DimDate] ([DateKey]),
    CONSTRAINT [FK_FactSales_DimEmployee] FOREIGN KEY ([EmployeeKey]) REFERENCES [dbo].[DimEmployee] ([EmployeeKey]),
    CONSTRAINT [FK_FactSales_DimProduct] FOREIGN KEY ([ProductKey]) REFERENCES [dbo].[DimProduct] ([ProductKey]),
    CONSTRAINT [FK_FactSales_DimShipper] FOREIGN KEY ([ShipperKey]) REFERENCES [dbo].[DimShipper] ([ShipperKey])
);

