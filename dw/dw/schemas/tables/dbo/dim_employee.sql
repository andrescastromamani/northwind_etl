CREATE TABLE [dbo].[DimEmployee] (
    [EmployeeKey] INT           IDENTITY (1, 1) NOT NULL,
    [EmployeeID]  INT           NOT NULL,
    [LastName]    NVARCHAR (20) NOT NULL,
    [FirstName]   NVARCHAR (10) NOT NULL,
    [Title]       NVARCHAR (30) NULL,
    PRIMARY KEY CLUSTERED ([EmployeeKey] ASC)
);