--SQLQueryHW - sp_InsertTeachersOFF.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER PROCEDURE sp_InsertTeachersOFF
AS
BEGIN
	
	DECLARE @count_OffId	AS TINYINT = (SELECT COUNT(Off_id) FROM TeachersOFF)
	DECLARE @count			AS TINYINT = 0;
	WHILE @count<=@count_OffId
	BEGIN
	DECLARE @teacher		AS SMALLINT		= (SELECT teacher	FROM TeachersOFF WHERE Off_id = @count);
	DECLARE @date			AS DATE			= (SELECT dateOFF	FROM TeachersOFF WHERE Off_id = @count);
	DECLARE @duration		AS TINYINT		= (SELECT duration	FROM TeachersOFF WHERE Off_id = @count);
	DECLARE @day_num		AS TINYINT		=	0;
	WHILE	@day_num	<	@duration
		BEGIN
			INSERT	DaysOffTeachers VALUES (@teacher, @date);
			SET		@day_num	= @day_num + 1;
			SET		@date	= DATEADD(DAY, 1, @date);
		END
	SET @count = @count+1;
	END

END