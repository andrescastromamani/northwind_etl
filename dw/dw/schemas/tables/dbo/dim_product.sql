CREATE TABLE [dbo].[DIM_PRODUCT](
	[ProductSK] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](40) NULL,
	[CategoryName] [nvarchar](15) NULL,
	[SupplierName] [nvarchar](40) NULL,
	[UnitPrice] [money] NULL,
	[Discontinued] [bit] NULL,
 CONSTRAINT [PK_DIM_PRODUCT] PRIMARY KEY CLUSTERED ([ProductSK] ASC));
GO