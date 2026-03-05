--SQLQueryHW - GetHolidayStartDate.sql
USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION GetHolidayStartDate (@year AS SMALLINT, @name_holiday AS NVARCHAR(150)) RETURNS DATE
AS
BEGIN
	DECLARE @holy_name		AS	NVARCHAR(150)	=	(SELECT holiday_name FROM Holidays WHERE holiday_name LIKE @name_holiday)
	DECLARE @date_holiday	AS	DATE	=	DATEFROMPARTS(@year
		,(CASE	@holy_name	WHEN 'Новогодние каникулы'		THEN 01
							WHEN '23 Февраля'				THEN (SELECT [month] FROM Holidays WHERE holiday_name LIKE @holy_name)
							WHEN '8 Марта'					THEN 03
							WHEN 'Пасха'					THEN 04
							WHEN 'Майские каникулы'			THEN 05
							WHEN 'Летние каникулы'			THEN 07
							WHEN 'День народного единства'	THEN 11
							ELSE 0 END)
		,(CASE	@holy_name	WHEN 'Новогодние каникулы'		THEN 01
							WHEN '23 Февраля'				THEN 23
							WHEN '8 Марта'					THEN 08
							WHEN 'Пасха'					THEN 12
							WHEN 'Майские каникулы'			THEN 01
							WHEN 'Летние каникулы'			THEN 01
							WHEN 'День народного единства'	THEN 04
							ELSE 0 END));
	DECLARE @weekday		AS	TINYINT	=	DATEPART(WEEKDAY, @date_holiday);
	DECLARE @start_date		AS	DATE	=	DATEADD(DAY
		,(CASE	@holy_name	WHEN 'Новогодние каникулы'		THEN 1-@weekday
							WHEN '23 Февраля'				THEN -1
							WHEN '8 Марта'					THEN -1
							WHEN 'Пасха'					THEN -1
							WHEN 'Майские каникулы'			THEN -1
							WHEN 'Летние каникулы'			THEN -1
							WHEN 'День народного единства'	THEN -1
							ELSE 0 END)
		,@date_holiday);
	IF @weekday = 7 SET @start_date = DATEADD(DAY, -1, @date_holiday);
	RETURN @start_date;
END