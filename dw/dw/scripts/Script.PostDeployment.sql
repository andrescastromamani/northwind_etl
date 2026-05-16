/* CARGA DE DATOS DESDE LA MISMA CARPETA */

PRINT 'Cargando DimDate...';
:r .\DimDate.Data.sql
GO

PRINT 'Aplicando parches de DimDate...';
:r .\PatchDimDate.Data.sql
GO

PRINT 'Inicializando configuracion de paquetes...';
:r .\PackageConfig.Data.sql
GO