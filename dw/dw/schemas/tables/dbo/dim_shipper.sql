CREATE TABLE [dbo].[DIM_SHIPPER](
	[ShipperID] [int] NOT NULL,
	[CompanyName] [nvarchar](40) NULL,
	PRIMARY KEY CLUSTERED ([ShipperID] ASC));
GO