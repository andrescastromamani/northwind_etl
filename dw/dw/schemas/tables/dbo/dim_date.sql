CREATE TABLE [dbo].[DIM_DATE](
	[DateID] [int] NOT NULL,
	[FullDate] [date] NULL,
	[Year] [int] NULL,
	[Month] [int] NULL,
	[MonthName] [nvarchar](15) NULL,
	[Quarter] [int] NULL,
	[Day] [int] NULL,
	PRIMARY KEY CLUSTERED ([DateID]));
GO
