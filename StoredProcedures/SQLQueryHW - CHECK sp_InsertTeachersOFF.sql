--SQLQueryHW - CHECK sp_InsertTeachersOFF
USE PV_521_Import;
SET DATEFIRST 1;
GO

EXEC sp_InsertTeachersOFF;

	--DECLARE @teacher		AS SMALLINT	= (SELECT Off_id FROM TeachersOFF);
	--DECLARE @date			AS DATE		= (SELECT dateOFF  FROM TeachersOFF);
	--DECLARE @duration		AS TINYINT	= (SELECT duration FROM TeachersOFF);
	--PRINT @teacher;
	--PRINT @date;
	--PRINT @duration;
		
	--DECLARE @day_num	AS TINYINT		=	0;
	--WHILE	@day_num	<	@duration
	--	BEGIN
	--		INSERT	DaysOffTeachers VALUES (@teacher, @date);
	--		SET		@day_num	= @day_num + 1;
	--		SET		@date	= DATEADD(DAY, 1, @date);
	--	END