CREATE TABLE [dbo].[PackageConfig](
	[PackageID] [int] IDENTITY(1,1) NOT NULL,
	[TableName] [varchar](50) NOT NULL,
	[LastRowVersion] [bigint] NULL,
	 CONSTRAINT [PK_PackageConfig] PRIMARY KEY CLUSTERED([PackageID] ASC));
GO