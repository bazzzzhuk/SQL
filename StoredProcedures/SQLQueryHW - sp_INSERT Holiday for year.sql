--SQLQueryHW - sp_INSERT Holidays for year.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO


CREATE OR ALTER PROCEDURE sp_InsertHolidayFor	@year	AS	SMALLINT
AS
BEGIN
	EXEC	sp_InsertHoliday	@year,	N'Новогодние каникулы';
	EXEC	sp_InsertHoliday	@year,	N'23 Февраля';
	EXEC	sp_InsertHoliday	@year,	N'8 Марта';
	EXEC	sp_InsertHoliday	@year,	N'Пасха';
	EXEC	sp_InsertHoliday	@year,	N'Майские каникулы';
	EXEC	sp_InsertHoliday	@year,	N'Летние каникулы';
	EXEC	sp_InsertHoliday	@year,	N'День народного единства';
END