-- SQLQueryHW - checkDay.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION CheckDay(@prevDate AS DATE)RETURNS DATE
AS
BEGIN
	SET		@prevDate	=	DATEADD(DAY,CASE DATEPART(WEEKDAY, @prevDate) WHEN 2 THEN 1 WHEN 4 THEN 1 WHEN 7 THEN 1 WHEN 6 THEN 2 ELSE 0 END, @prevDate)--WeekDayFilter
	WHILE @prevDate = (SELECT date FROM DaysOFF WHERE @prevDate = date) SET @prevDate = dbo.NextDate(@prevDate);
	RETURN @prevDate;
END