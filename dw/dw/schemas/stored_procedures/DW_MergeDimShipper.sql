CREATE PROCEDURE [dbo].[DW_MergeDimShipper]
AS
BEGIN
    UPDATE ds
    SET ds.[CompanyName] = ss.[CompanyName],
        ds.[Phone] = ss.[Phone]
    FROM [dbo].[DimShipper] ds
    INNER JOIN [staging].[shipper] ss ON ds.[ShipperID] = ss.[ShipperID];

    INSERT INTO [dbo].[DimShipper] ([ShipperID], [CompanyName], [Phone])
    SELECT ss.[ShipperID], ss.[CompanyName], ss.[Phone]
    FROM [staging].[shipper] ss
    LEFT JOIN [dbo].[DimShipper] ds ON ss.[ShipperID] = ds.[ShipperID]
    WHERE ds.[ShipperID] IS NULL;
END
GO