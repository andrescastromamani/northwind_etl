/*
--------------------------------------------------------------------------------------
REGISTRO NULO PARA DIMDATE (PATCH)
--------------------------------------------------------------------------------------
*/

IF NOT EXISTS(SELECT 1 FROM [dbo].[DimDate] WHERE [DateKey] = 0)
BEGIN
    INSERT INTO [dbo].[DimDate] (
        [DateKey], [FullDate], [DayNumberOfWeek], [DayNameOfWeek], 
        [DayNumberOfMonth], [DayNumberOfYear], [WeekNumberOfYear], 
        [MonthName], [MonthNumberOfYear], [CalendarQuarter], 
        [CalendarYear], [CalendarSemester]
    )
    VALUES (
        0,              -- DateKey para representar "Desconocido"
        '1900-01-01',   -- Fecha base
        0, 'Desconocido', 0, 0, 0, 'Desconocido', 0, 0, 0, 0
    );
    PRINT 'Registro nulo insertado en DimDate.';
END
GO