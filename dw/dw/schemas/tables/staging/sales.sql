CREATE TABLE [staging].[sales](
    [OrderID] [int] NOT NULL,
    [CustomerID] [nchar](5) NULL,
    [EmployeeID] [int] NULL,
    [ProductID] [int] NOT NULL,
    [ShipperID] [int] NULL,
    [OrderDate] [datetime] NULL,
    [UnitPrice] [money] NOT NULL,
    [Quantity] [smallint] NOT NULL,
    [Discount] [real] NOT NULL
);
GO