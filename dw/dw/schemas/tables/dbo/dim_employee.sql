CREATE TABLE [dbo].[DIM_EMPLOYEE](
	[EmployeeID] [int] NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Title] [nvarchar](30) NULL,
	[City] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
	PRIMARY KEY CLUSTERED ([EmployeeID]));
GO