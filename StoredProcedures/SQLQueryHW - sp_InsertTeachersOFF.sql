--SQLQueryHW - sp_InsertTeachersOFF.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER PROCEDURE sp_InsertTeachersOFF
AS
BEGIN
	DECLARE @teacher		AS SMALLINT	= (SELECT teacher  FROM TeachersOFF);
	DECLARE @date			AS DATE		= (SELECT dateOFF  FROM TeachersOFF);
	DECLARE @duration		AS TINYINT	= (SELECT duration FROM TeachersOFF);
	PRINT @teacher;
	PRINT @date;
	PRINT @duration;
			
	DECLARE @day_num	AS TINYINT		=	0;
	WHILE	@day_num	<	@duration
		BEGIN
			INSERT	DaysOffTeachers VALUES (@teacher, @date);
			SET		@day_num	= @day_num + 1;
			SET		@date	= DATEADD(DAY, 1, @date);
		END

END