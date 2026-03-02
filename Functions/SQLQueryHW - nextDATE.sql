-- SQLQueryHW - nextDATE.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION NextDate(@prevDate AS DATE)RETURNS DATE
AS
BEGIN
	SET		@prevDate	=	DATEADD(DAY,CASE DATEPART(WEEKDAY, @prevDate) WHEN 2 THEN 1 WHEN 4 THEN 1 WHEN 7 THEN 1 WHEN 6 THEN 2 ELSE 0 END, @prevDate)--WeekDayFilter
		IF @prevDate = (SELECT date FROM DaysOFF WHERE @prevDate = date)
			WHILE @prevDate = (SELECT date FROM DaysOFF WHERE @prevDate = date)
				BEGIN
					DECLARE @day	AS TINYINT		=	DATEPART(WEEKDAY, @prevDate);
					SET @prevDate	=	DATEADD(DAY,IIF(@day = 5,3,2),@prevDate);
				END	
		ELSE
			BEGIN
				DECLARE @day2	AS TINYINT		=	DATEPART(WEEKDAY, @prevDate);
				SET @prevDate	=	DATEADD(DAY,IIF(@day2 = 5,3,2),@prevDate);
			END
	RETURN @prevDate ;
END