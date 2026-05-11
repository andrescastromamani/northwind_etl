CREATE TABLE [dbo].[FACT_SALES](
	[SaleID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [nchar](5) NULL,
	[ProductID] [int] NULL,
	[ProductSK] [int] NOT NULL,
	[EmployeeID] [int] NULL,
	[ShipperID] [int] NULL,
	[DateID] [int] NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [money] NULL,
	[Discount] [float] NULL,
	[TotalAmount] [money] NULL,
	PRIMARY KEY CLUSTERED ([SaleID] ASC));
GO

ALTER TABLE [dbo].[FACT_SALES] ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[DIM_CUSTOMER] ([CustomerID])
GO
ALTER TABLE [dbo].[FACT_SALES] ADD FOREIGN KEY([DateID])
REFERENCES [dbo].[DIM_DATE] ([DateID])
GO
ALTER TABLE [dbo].[FACT_SALES] ADD FOREIGN KEY([EmployeeID])
REFERENCES [dbo].[DIM_EMPLOYEE] ([EmployeeID])
GO
ALTER TABLE [dbo].[FACT_SALES] ADD FOREIGN KEY([ProductSK])
REFERENCES [dbo].[DIM_PRODUCT] ([ProductSK])
GO
ALTER TABLE [dbo].[FACT_SALES] ADD FOREIGN KEY([ShipperID])
REFERENCES [dbo].[DIM_SHIPPER] ([ShipperID])
GO