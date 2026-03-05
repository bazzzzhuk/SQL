--SQLQueryHW - sp_INSERTHoliday.sql
USE PV_521_Import;
SET DATEFIRST 1;
GO
CREATE OR ALTER PROCEDURE sp_InsertHoliday
				@holiday_year	AS SMALLINT,
				@holiday_name	AS NVARCHAR(150)
AS
BEGIN
	DECLARE		@start_date		AS DATE		=	dbo.GetHolidayStartDate(@holiday_year, @holiday_name);
	DECLARE		@duration		AS TINYINT	=	(SELECT duration	FROM Holidays	WHERE holiday_name LIKE @holiday_name);
	DECLARE		@holiday_id		AS TINYINT	=	(SELECT holiday_id	FROM Holidays	WHERE holiday_name LIKE @holiday_name);

	DECLARE		@date			AS DATE		=	@start_date;
	DECLARE		@days_holiday	AS TINYINT	=	0;
	WHILE		@days_holiday < @duration
	BEGIN
		INSERT	DaysOFF	([date],holiday)
		VALUES	(@date, @holiday_id)
		SET		@days_holiday	+=	1;
		SET		@date			=	DATEADD(DAY, 1, @date);
	END
END