-- SQLQueryHW_SELECT Count Group and Students.sql

SELECT	
		 direction_name		AS N'Направление обучения'
		,COUNT(group_id)	AS N'Количество групп'
		,COUNT(stud_id)		AS N'Количество Студентов'

FROM	Directions, Groups,  Students
WHERE	direction_id = direction
AND		group_id = [group]
--AND		stud_id = stud_id
--AND			direction_id	=	direction
--OR
--		(group_id = [group] OR direction = direction_id)
--OR			group_id
		
GROUP BY	direction_name, group_name
;