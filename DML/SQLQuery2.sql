-- SQLQueryHW - Discipline And Teachers .sql

SELECT
			discipline_name		AS N'Предмет'
			,COUNT(teacher)		AS N'Количество преподавателей'

FROM		TeachersDisciplinesRelation, Disciplines, Teachers

WHERE
			discipline = discipline_id
AND			teacher = teacher_id

GROUP BY	discipline_name
ORDER BY	[Количество преподавателей]	DESC
;