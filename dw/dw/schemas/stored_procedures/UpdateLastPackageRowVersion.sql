CREATE PROCEDURE [dbo].[UpdateLastPackageRowVersion]
(
	@tableName VARCHAR(50),
	@lastRowVersion BIGINT
)
AS
BEGIN
	SET NOCOUNT ON
	
	UPDATE [dbo].[PackageConfig]
	SET LastRowVersion = @lastRowVersion
	WHERE TableName = @tableName
END
GO

