--SQLQueryHW - GetShiftDate.sql
USE PV_521_Import;
SET DATEFIRST 1;
GO
-- Определяет на сколько дней надо сместить график учитывая праздники
CREATE OR ALTER FUNCTION GetShiftDate(@group_name AS NCHAR(10), @shift AS TINYINT)RETURNS DATE
AS
BEGIN
	DECLARE @start_shift		AS TINYINT	= 0;
	DECLARE @group_id			AS INT		= (SELECT group_id		FROM Groups		WHERE group_name = @group_name);
	DECLARE @last_Schedule_date AS DATE		= (SELECT MAX([date])	FROM Schedule	WHERE [group]	 = @group_id);

	WHILE @start_shift<@shift
		BEGIN
		
		END
	RETURN 0;
END