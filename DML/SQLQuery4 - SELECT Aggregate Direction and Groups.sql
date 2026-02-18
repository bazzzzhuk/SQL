-- SQLQuery4 - SELECT Aggregate Direction and Groups.sql

USE PV_521_Import

SELECT
			direction_name				AS N'Направление обучения'
			--,COUNT(stud_id)				AS N'Количество студентов'
			--,COUNT(DISTINCT group_id)	AS N'Количество групп'
			,(SELECT COUNT(group_id) FROM Groups WHERE direction = direction_id) AS N'Групп' 
			,(SELECT COUNT (stud_id)FROM Students, Groups WHERE [group]=group_id AND direction = direction_id)AS N'Stud'
FROM		Directions
;