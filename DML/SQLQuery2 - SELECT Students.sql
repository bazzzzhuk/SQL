-- SQLQuery2 - SELECT Students.sql

USE PV_521_Import;

SELECT 
			--last_name AS N'Фамилия'
			--,first_name AS N'Имя'
			--,middle_name AS N'Отчество'
			[Студент] = FORMATMESSAGE(N'%s %s %s', Students.last_name, first_name, middle_name)
			,Students.birth_date AS N'Дата Рождения'
			,group_name AS N'Группа'
			,Directions.direction_name AS N'Направление обучения'
FROM		Students, Groups, Directions
WHERE		[group]		=		group_id
AND			direction	=		direction_id
;