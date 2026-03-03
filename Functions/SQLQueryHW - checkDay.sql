-- SQLQueryHW - checkDay.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION CheckLearningDay(@date AS DATE, @group_name	AS NCHAR(10))RETURNS DATE
AS
BEGIN
	--SET		@date	=	DATEADD(DAY,CASE DATEPART(WEEKDAY, @date)		WHEN 2 THEN 1 WHEN 4 THEN 1 WHEN 7 THEN 1 WHEN 6 THEN 2 ELSE 0 END, @date)	--WeekDayFilter
	WHILE	@date	=	(SELECT date FROM DaysOFF WHERE @date = date)	SET @date = dbo.GetNextLearningDate(@date, @group_name);									-- Check HollyDay (DaysOFF)
	RETURN	@date;
END