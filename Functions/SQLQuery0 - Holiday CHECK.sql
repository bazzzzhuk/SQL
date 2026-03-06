-- SQLQuery0 - Holiday CHECK.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

--PRINT dbo.GetNewYearHolidaysStartDate(2026);
--PRINT dbo.GetHolidayStartDate (2026, N'Новогодние каникулы');

--DELETE FROM DaysOff		WHERE	[date]	BETWEEN	N'2025-12-29' AND N'2026-12-31'
--EXEC sp_InsertHolidayFor 2026;
--SELECT
--		[date],holiday_name
--FROM	DaysOff JOIN Holidays ON (holiday=holiday_id)
--WHERE	[date]	BETWEEN	N'2025-12-20' AND N'2026-12-31';

--PRINT dbo.GetSummertimeSadness(2025);
--PRINT dbo.GetEasterDate(1977);

--EXEC sp_InsertAllHolidaysFor 2026;

SELECT 
	[Date] = date,
	[Holidays]=	holiday_name
FROM DaysOFF, Holidays
WHERE holiday = holiday_id
AND date >= DATEFROMPARTS(2025,12,20)
;

