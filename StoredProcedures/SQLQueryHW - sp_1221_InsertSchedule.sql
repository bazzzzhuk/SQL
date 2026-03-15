-- SQLQueryHW - sp_1221_InsertSchedule.sql
USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER PROCEDURE sp_1221_InsertSchedule  
	 @group_name					AS NCHAR(10)
	,@discipline_name_1				AS NVARCHAR(150)
	,@discipline_name_2				AS NVARCHAR(150)
	,@teacher_name_1				AS NVARCHAR(50)
	,@teacher_name_2				AS NVARCHAR(50)
	,@start_date_1					AS DATE
	,@start_date_2					AS DATE
AS
BEGIN
	DECLARE @group					AS INT			 =	(SELECT group_id			FROM Groups		 WHERE group_name	    =    @group_name);
	DECLARE @start_time				AS TIME			 =	(SELECT start_time			FROM Groups		 WHERE group_id			=	 @group);
	DECLARE @discipline_1			AS SMALLINT		 =	(SELECT discipline_id		FROM Disciplines WHERE discipline_name	LIKE @discipline_name_1);
	DECLARE @discipline_2			AS SMALLINT		 =	(SELECT discipline_id		FROM Disciplines WHERE discipline_name	LIKE @discipline_name_2);
	DECLARE @number_of_lessons_1	AS TINYINT		 =	(SELECT	number_of_lessons	FROM Disciplines WHERE discipline_name	LIKE @discipline_name_1);
	DECLARE @number_of_lessons_2	AS TINYINT		 =	(SELECT	number_of_lessons	FROM Disciplines WHERE discipline_name	LIKE @discipline_name_2);
	DECLARE	@teacher_1				AS SMALLINT		 =	(SELECT teacher_id			FROM Teachers	 WHERE last_name		LIKE @teacher_name_1	OR first_name LIKE @teacher_name_1);
	DECLARE	@teacher_2				AS SMALLINT		 =	(SELECT teacher_id			FROM Teachers	 WHERE last_name		LIKE @teacher_name_2	OR first_name LIKE @teacher_name_2);

	DECLARE @date					AS DATE				= IIF(@start_date_1 < @start_date_2, @start_date_1 , @start_date_2);
	DECLARE @teacher				AS SMALLINT;
	DECLARE @teacher_name			AS NVARCHAR(50);
	DECLARE @discipline				AS SMALLINT;
	DECLARE @name_discipline		AS NVARCHAR(150);
	DECLARE	@lesson_number			AS TINYINT;
	DECLARE @lesson_number_1		AS TINYINT		 = @number_of_lessons_1;
	DECLARE @lesson_number_2		AS TINYINT		 = @number_of_lessons_2;
	DECLARE @time					AS TIME(0)		 = @start_time;
	DECLARE @wednesday_switch		AS BIT			 = IIF(@date=@start_date_1,1,0);

	WHILE	(@lesson_number_1 < @number_of_lessons_1 OR @lesson_number_2 < @number_of_lessons_2) -- OR!!!
	BEGIN
		DECLARE @day			AS TINYINT	=	DATEPART(WEEKDAY, @date);
		SET		@time = @start_time;
-------> День HardwarePC				(Понедельник)
		IF(@day = 1) IF @lesson_number_2 > 0 AND @start_date_2 <= @date SET @discipline = @discipline_2 ELSE SET @discipline = @discipline_1
-------> ДЕНЬ С++/HardwarePC	(Среда)
		IF(@day = 3)																	BEGIN
				IF @wednesday_switch = 0												BEGIN
						IF			@lesson_number_2 > 0 AND @start_date_2 <= @date		BEGIN
								SET @discipline = @discipline_2
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)	END
						ELSE IF		@lesson_number_1 > 0 AND @start_date_1 <= @date		BEGIN
								SET @discipline = @discipline_1
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)	END END
				ELSE IF @wednesday_switch = 1											BEGIN
						IF			@lesson_number_1 > 0 AND @start_date_1 <= @date		BEGIN
								SET @discipline = @discipline_1
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)	END
						ELSE IF		@lesson_number_2 > 0 AND @start_date_2 <= @date		BEGIN
								SET @discipline = @discipline_2
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)	END END END
-------> ДЕНЬ С++				(Пятница)
		IF(@day = 5) IF	@lesson_number_1 > 0 AND @start_date_1 <= @date SET @discipline = @discipline_1 ELSE IF	@lesson_number_2 > 0 AND @start_date_2 <= @date SET @discipline = @discipline_2
------->
		SET			@teacher		= IIF(@discipline = @discipline_1, @teacher_1, @teacher_2);
		SET 		@lesson_number  = IIF(@discipline = @discipline_1, @lesson_number_1, @lesson_number_2);

		EXEC	sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;
		EXEC	sp_InsertLesson @group, @discipline, @teacher, @date, @time OUTPUT, @lesson_number OUTPUT;
	END

END