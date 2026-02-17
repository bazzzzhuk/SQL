-- SQLQueryHW - Teacher And Disciplines.sql

SELECT
			last_name		AS 'Учитель'
			,COUNT(discipline)	AS 'Количество Дисцилин'

FROM		Teachers, TeachersDisciplinesRelation, Disciplines

WHERE 
			teacher = teacher_id
AND			discipline = discipline_id

GROUP BY	last_name
ORDER BY	[Количество Дисцилин]	DESC
;