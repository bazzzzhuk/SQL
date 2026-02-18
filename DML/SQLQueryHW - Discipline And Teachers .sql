-- SQLQueryHW - Discipline And Teachers .sql

SELECT
			discipline_name		AS 'Дисцилина'
			,COUNT(last_name)	AS 'Количество Учителей'

FROM		Teachers, TeachersDisciplinesRelation, Disciplines

WHERE		teacher = teacher_id
			--teacher = teacher_id
AND			discipline = discipline_id

GROUP BY	discipline_name
ORDER BY	COUNT(last_name)	DESC
;