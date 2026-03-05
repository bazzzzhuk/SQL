-- SQLQuery0 - Holiday CHECK.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

--PRINT dbo.GetNewYearHolidaysStartDate(2026);
--PRINT dbo.GetHolidayStartDate (2026, N'Новогодние каникулы');

DELETE FROM DaysOff		WHERE	[date]	BETWEEN	N'2025-12-29' AND N'2026-12-31'
EXEC sp_InsertHolidayFor 2026;
SELECT
		[date],holiday_name
FROM	DaysOff JOIN Holidays ON (holiday=holiday_id)
WHERE	[date]	BETWEEN	N'2025-12-20' AND N'2026-12-31';