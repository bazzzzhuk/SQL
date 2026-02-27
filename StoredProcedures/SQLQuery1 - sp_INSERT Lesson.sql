-- SQLQuery1 - sp_INSERT Lesson.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE PROCEDURE sp_InsertLesson
		 @group			AS INT
		, @discipline	AS SMALLINT
		, @teacher		AS SMALLINT
		, @date			AS DATE
		, @time			AS TIME(0)
AS
BEGIN
	IF NOT EXISTS (SELECT lesson_id FROM Schedule WHERE [date]=@date AND [time]=@time AND [group]=@group)
		INSERT Schedule VALUES (@group, @discipline, @teacher, @date, @time, IIF(@date<GETDATE(),1,0));
END