-- SQLQueryHW - INSERT 12-21.sql
-----------------------------------------------------------------------------------------------------------------------------------------
USE PV_521_Import;
SET DATEFIRST 1;
-----------------------------------------------------------------------------------------------------------------------------------------
DECLARE @name_discipline_1		AS	NVARCHAR(150)	= N'%Процедурное%';
DECLARE @start_date_1			AS  DATE			=N'2025-01-27';
DECLARE @teacher_1				AS	SMALLINT		=(SELECT teacher_id			FROM Teachers		WHERE first_name = N'Олег');
------->
DECLARE @name_discipline_2		AS	NVARCHAR(150)	=N'%Hardware%';
DECLARE @start_date_2			AS  DATE			=N'2025-02-10';
DECLARE @teacher_2				AS	SMALLINT		=(SELECT teacher_id			FROM Teachers		WHERE last_name = N'Свищев');
-----------------------------------------------------------------------------------------------------------------------------------------
DECLARE @group					AS	INT				=(SELECT group_id			FROM Groups			WHERE group_name=N'PV_521');
DECLARE @discipline_1			AS	SMALLINT		=(SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE @name_discipline_1);
DECLARE @number_of_lessons_1	AS	TINYINT			=(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id=@discipline_1);
DECLARE @discipline_2			AS	SMALLINT		=(SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE @name_discipline_2);
DECLARE @number_of_lessons_2	AS	TINYINT			=(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id=@discipline_2);
DECLARE @start_time				AS	TIME			=(SELECT start_time			FROM Groups			WHERE group_id=@group);
--> PRINT BASE <-------------------------------------------------------------------------------------------------------------------------
--PRINT(@group);
--PRINT(@discipline_1);
--PRINT(@discipline_2);
--PRINT(@number_of_lessons_1);
--PRINT(@number_of_lessons_2);
--PRINT(@start_date_1);
--PRINT(@start_date_2);
--PRINT(@start_time);
-----------------------------------------------------------------------------------------------------------------------------------------
DECLARE @date				AS DATE		= IIF(@start_date_1 < @start_date_2, @start_date_1 , @start_date_2);
--PRINT(DATEPART(WEEKDAY, @date));
SET @date	=	DATEADD(DAY,CASE DATEPART(WEEKDAY, @date) WHEN 2 THEN 1 WHEN 4 THEN 1 WHEN 7 THEN 1 WHEN 6 THEN 2 ELSE 0 END, @date)--WeekDayFilter
--PRINT(DATEPART(WEEKDAY, @date));
DECLARE @teacher			AS SMALLINT;
DECLARE @teacher_name		AS NVARCHAR(50);
DECLARE @discipline			AS SMALLINT;
DECLARE @name_discipline	AS NVARCHAR(150);
DECLARE @lesson_number_1	AS TINYINT	= @number_of_lessons_1;
DECLARE @lesson_number_2	AS TINYINT	= @number_of_lessons_2;
DECLARE @time				AS TIME(0)	= @start_time;
DECLARE @wednesday_switch	AS BIT		= IIF(@date=@start_date_1,1,0);
PRINT(FORMATMESSAGE(N'%s %s %s %s, %s',N'Старт с ',CAST(DATEPART(WEEKDAY, @date) AS VARCHAR(24)),N'дня недели: ', DATENAME(WEEKDAY,@date), CAST(@date AS VARCHAR(24))))
PRINT(N'')
-----------------------------------------------------------------------------------------------------------------------------------------
WHILE	(@lesson_number_2 > 0 OR @lesson_number_1 > 0) -- OR!!!
	BEGIN
	DECLARE		@lesson	AS TINYINT;
		DECLARE @day	AS TINYINT	=	DATEPART(WEEKDAY, @date);
		SET		@time = @start_time;
-------> День HardwarePC				(Понедельник)
		IF(@day = 1) IF @lesson_number_2 > 0 AND @start_date_2 <= @date SET @discipline = @discipline_2 ELSE SET @discipline = @discipline_1
-------> ДЕНЬ С++/HardwarePC	(Среда)
		IF(@day = 3)
			BEGIN
				IF @wednesday_switch = 0 
					BEGIN
						IF			@lesson_number_2 > 0 AND @start_date_2 <= @date
							BEGIN
								SET @discipline = @discipline_2
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)		
							END
						ELSE IF		@lesson_number_1 > 0 AND @start_date_1 <= @date
							BEGIN
								SET @discipline = @discipline_1
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)
							END
					END
				ELSE IF @wednesday_switch = 1 
					BEGIN
						IF			@lesson_number_1 > 0 AND @start_date_1 <= @date
							BEGIN
								SET @discipline = @discipline_1
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)
							END
						ELSE IF		@lesson_number_2 > 0 AND @start_date_2 <= @date
							BEGIN
								SET @discipline = @discipline_2
								SET @wednesday_switch = IIF(@wednesday_switch=0,1,0)		
							END
					END
			END
-------> ДЕНЬ С++				(Пятница)
		IF(@day = 5) IF	@lesson_number_1 > 0 AND @start_date_1 <= @date SET @discipline = @discipline_1 ELSE IF	@lesson_number_2 > 0 AND @start_date_2 <= @date SET @discipline = @discipline_2
------->
SET			@name_discipline = (SELECT discipline_name FROM Disciplines WHERE discipline_id = @discipline);
SET			@teacher =		IIF(@discipline = @discipline_1, @teacher_1, @teacher_2);
SET			@teacher_name =	FORMATMESSAGE(N'%s %s %s'
,(SELECT	last_name		FROM Teachers WHERE teacher_id = @teacher)
,(SELECT	first_name		FROM Teachers WHERE teacher_id = @teacher)
,(SELECT	middle_name		FROM Teachers WHERE teacher_id = @teacher));
-------<
--> Lesson_1
IF @discipline = @discipline_1 SET @lesson = @lesson_number_1 ELSE SET @lesson = @lesson_number_2;
IF @discipline = @discipline_1 SET @lesson_number_1 = @lesson_number_1 - 1 ELSE SET @lesson_number_2 = @lesson_number_2 - 1;
		PRINT(FORMATMESSAGE(N'%i	│%s│%s%s│%s│%s%s│%s'
		, @lesson
		, CAST(@date AS VARCHAR(24))
		, DATENAME(WEEKDAY, @date)
		, IIF(@day=3,N'',N'   ')
		, CAST(@time AS VARCHAR(24))
		, @name_discipline
		, IIF(@discipline = @discipline_2, N'								',N'')
		, @teacher_name));
------->
		--IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date]=@date AND [time]=@time AND [group]=@group)
		--INSERT Schedule VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
--> Lesson_2
SET @time = DATEADD(MINUTE, 95, @start_time);
IF @discipline = @discipline_1 SET @lesson = @lesson_number_1 ELSE SET @lesson = @lesson_number_2;
IF @discipline = @discipline_1 SET @lesson_number_1 = @lesson_number_1 - 1 ELSE SET @lesson_number_2 = @lesson_number_2 - 1;
--PRINT(@lesson);
		PRINT(FORMATMESSAGE(N'%i	│%s│%s%s│%s│%s%s│%s'
		, @lesson
		, CAST(@date AS VARCHAR(24))
		, DATENAME(WEEKDAY, @date)
		, IIF(@day=3,N'',N'   ')
		, CAST(@time AS VARCHAR(24))
		, @name_discipline
		, IIF(@discipline = @discipline_2, N'								',N'')
		, @teacher_name));
------->
		--IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date]=@date AND [time]=@time AND [group]=@group)
		--INSERT Schedule VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
-------<
		SET @date =	DATEADD(DAY,IIF(@day = 5,3,2),@date);
		IF(	@day  =	5) PRINT(N'►>═─┼──────────┼─────────┼────═►> ☼ <◄═─────────────────────────────────────┼──────────────────────═<◄')
	END