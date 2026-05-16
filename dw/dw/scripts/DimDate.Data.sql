/*
--------------------------------------------------------------------------------------
SCRIPT DE CARGA DE DIMDATE - OPTIMIZADO PARA NORTHWIND
--------------------------------------------------------------------------------------
NOTE: Si este archivo forma parte de un proyecto de base de datos (SSDT / Database Project),
las instrucciones de control de flujo y DML (IF, WHILE, INSERT, PRINT, etc.) no están permitidas
en archivos que se compilan como objetos del modelo. Mueva este script a la carpeta de
Post-Deployment (por ejemplo: Scripts\Post-Deployment\DimDate.postdeployment.sql) o marque
el archivo como script de post-despliegue en las propiedades del proyecto para evitar
el error "SQL70001: Esta instrucción no se reconoce en este contexto."
--------------------------------------------------------------------------------------*/

IF NOT EXISTS(SELECT TOP(1) 1 FROM [dbo].[DimDate])
BEGIN
    BEGIN TRAN 
        -- Rango ajustado para cubrir NorthWind (1996) hasta el futuro (2030)
        DECLARE @startdate DATE = '1996-01-01',
                @enddate   DATE = '2030-12-31';
        
        DECLARE @datelist TABLE(FullDate DATE);

        -- Llenar tabla temporal con el rango de fechas
        WHILE (@startdate <= @enddate)
        BEGIN 
            INSERT INTO @datelist(FullDate) SELECT @startdate;
            SET @startdate = DATEADD(dd, 1, @startdate);
        END

        -- Inserción final en la dimensión
        INSERT INTO dbo.DimDate (
            DateKey, 
            FullDate, 
            DayNumberOfWeek, 
            DayNameOfWeek, 
            DayNumberOfMonth, 
            DayNumberOfYear, 
            WeekNumberOfYear, 
            [MonthName], 
            MonthNumberOfYear, 
            CalendarQuarter, 
            CalendarYear, 
            CalendarSemester
        )
        SELECT 
            DateKey           = CONVERT(INT, CONVERT(VARCHAR, dl.FullDate, 112)),
            FullDate          = dl.FullDate,
            DayNumberOfWeek   = DATEPART(dw, dl.FullDate),
            DayNameOfWeek     = DATENAME(WEEKDAY, dl.FullDate), 
            DayNumberOfMonth  = DATEPART(d, dl.FullDate),
            DayNumberOfYear   = DATEPART(dy, dl.FullDate),
            WeekNumberOfYear  = DATEPART(wk, dl.FullDate),
            [MonthName]       = DATENAME(MONTH, dl.FullDate), 
            MonthNumberOfYear = MONTH(dl.FullDate),
            CalendarQuarter   = DATEPART(qq, dl.FullDate),
            CalendarYear      = YEAR(dl.FullDate),
            CalendarSemester  = CASE 
                                    WHEN DATEPART(qq, dl.FullDate) <= 2 THEN 1 
                                    ELSE 2 
                                END
        FROM @datelist dl
        LEFT OUTER JOIN dbo.DimDate dd ON (dl.FullDate = dd.FullDate)
        WHERE dd.FullDate IS NULL;
    COMMIT TRAN
    PRINT 'DimDate cargada exitosamente para el rango 1996-2030.'; 
END
GO