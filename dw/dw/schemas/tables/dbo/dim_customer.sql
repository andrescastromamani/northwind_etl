CREATE TABLE [dbo].[DIM_CUSTOMER](
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NULL,
	[ContactName] [nvarchar](30) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
	PRIMARY KEY CLUSTERED ([CustomerID]));
GO