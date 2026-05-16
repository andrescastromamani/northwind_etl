CREATE TABLE [staging].[customer](
    [CustomerID] [nchar](5) NOT NULL, -- El ID original de NorthWind
    [CompanyName] [nvarchar](40) NOT NULL,
    [City] [nvarchar](15) NULL,
    [Country] [nvarchar](15) NULL
);
GO
