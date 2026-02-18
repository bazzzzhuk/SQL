-- SQLQueryHW_SELECT Count Group and Students.sql

SELECT	
		 direction_name				AS N'Направление обучения'
		,COUNT(DISTINCT group_id)	AS N'Количество групп'
		,COUNT(stud_id)				AS N'Количество Студентов'

FROM	Directions, Groups,  Students
WHERE	
		group_id = [group]
AND		direction_id	=	direction
GROUP BY	direction_name
;

