-- SQLQuery1 -sp INSERT Schedule.sql
USE PV_521_Import;
SET DATEFIRST 1;
GO -- Кнопка применить

ALTER PROCEDURE sp_InsertScheduleStacionar
	@group_name			AS NCHAR(10),
	@discipline_name	AS NVARCHAR(150),
	@teacher_first_name	AS NVARCHAR(50),
	@start_date			AS DATE = N'1900-01-01'
AS
BEGIN
	DECLARE @group				AS INT		=	(SELECT group_id			FROM Groups			WHERE group_name		LIKE @group_name);
	DECLARE @teacher			AS SMALLINT	=	(SELECT	teacher_id			FROM Teachers		WHERE first_name		LIKE @teacher_first_name);
	DECLARE @discipline			AS SMALLINT	=	(SELECT discipline_id		FROM Disciplines	WHERE discipline_name	LIKE @discipline_name);
	DECLARE @number_of_lessons	AS TINYINT	=	(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_name	LIKE @discipline_name);
	DECLARE @start_time			AS TIME		=	(SELECT start_time FROM GROUPS WHERE group_id=@group);

PRINT(@start_date);
PRINT(@start_time);

DECLARE @date			AS DATE		= 
		IIF(@start_date<>N'1900-01-01',@start_date, (SELECT MAX([date])FROM Schedule WHERE [group]=@group));
DECLARE @lesson_number	AS TINYINT	= dbo.CountLessons(@group, @discipline);
DECLARE @time	AS TIME(0) = @start_time;
WHILE	@lesson_number < @number_of_lessons
	BEGIN
		SET		@date	=	dbo.GetNextLearnDate(@group_name, @date);
		SET		@time	=	@start_time;
		--SET		@date	=	dbo.CheckLearningDay(@date, @group_name);
		EXEC	sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;
		EXEC	sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;
		--SET		@date	=	dbo.GetNextLearningDate(@date, @group_name); --my

		--DECLARE @day	AS TINYINT		=	DATEPART(WEEKDAY, @date); -- как раз для этого написано
		--SET @date						=	DATEADD(DAY,IIF(@day = 5,3,2),@date);
	END
END