--SQLQueryHW - CheckFreeTeacher.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION CheckBusyTeacher(@teacher SMALLINT, @date AS DATE)RETURNS BIT
AS
BEGIN RETURN IIF(NOT EXISTS(SELECT lesson_id	FROM Schedule			WHERE [date]=@date	AND teacher = @teacher),	0,1)  
			 |
			 IIF(NOT EXISTS(SELECT id			FROM DaysOffTeachers	WHERE [date]=@date	AND teacherOFF = @teacher), 0,1)
END