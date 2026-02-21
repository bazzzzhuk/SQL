-- SQLQueryHW - INSERT 12-21.sql
-----------------------------------------------------------------------------------------------------------------------------------------
USE PV_521_Import;
SET DATEFIRST 1;
-----------------------------------------------------------------------------------------------------------------------------------------
DECLARE @name_discipline_1		AS	NCHAR(10)	=N'%Процедурное программирование на языке C++%';
DECLARE @name_discipline_2		AS	NCHAR(10)	=N'%Hardware%';
-----------------------------------------------------------------------------------------------------------------------------------------
DECLARE @group					AS	INT		=(SELECT group_id			FROM Groups			WHERE group_name=N'PV_521');
DECLARE @discipline_1			AS	INT		=(SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE N'%Процедурное программирование на языке C++%');
DECLARE @start_date_1			AS  DATE		=N'2025-01-20';
DECLARE @number_of_lessons_1	AS	TINYINT =(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id=@discipline_1);
DECLARE @discipline_2			AS	INT		=(SELECT discipline_id		FROM Disciplines	WHERE discipline_name LIKE N'%Hardware%');
DECLARE @start_date_2			AS  DATE		=N'2025-02-10';
DECLARE @number_of_lessons_2	AS	TINYINT =(SELECT number_of_lessons	FROM Disciplines	WHERE discipline_id=@discipline_2);
DECLARE @teacher				AS	INT		=(SELECT teacher_id			FROM Teachers		WHERE first_name = N'Олег');
DECLARE @start_time				AS	TIME	=(SELECT start_time			FROM Groups			WHERE group_id=@group);
-----------------------------------------------------------------------------------------------------------------------------------------
PRINT(@group);
PRINT(@discipline_1);
PRINT(@discipline_2);
PRINT(@number_of_lessons_1);
PRINT(@number_of_lessons_2);
PRINT(@teacher);
PRINT(@start_date_1);
PRINT(@start_date_2);
PRINT(@start_time);
-----------------------------------------------------------------------------------------------------------------------------------------
