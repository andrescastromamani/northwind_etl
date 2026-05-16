CREATE TABLE [staging].[product](
    [ProductID] [int] NOT NULL,
    [ProductName] [nvarchar](40) NOT NULL,
    [CategoryName] [nvarchar](15) NULL,
    [SupplierName] [nvarchar](40) NULL,
    [UnitPrice] [money] NULL
);
GO
