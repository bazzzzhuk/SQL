--SQLQuery1 - SELECT TeachersOFF.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

SELECT
		[Препод]		=	last_name
		,[Дата]			=	[date]

FROM	Teachers,DaysOffTeachers
WHERE	teacherOFF=teacher_id
ORDER BY [date]
;