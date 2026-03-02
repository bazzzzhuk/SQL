-- SQLQuery0 - CHECK.sql

USE PV_521_Import
SET DATEFIRST 1;

--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%ADO.NET%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Объектно%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Процедурное%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Hardware-PC%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Теория баз данных, программирование MS SQL Server%')

EXEC sp_InsertScheduleStacionar N'PV_521', N'%ADO.NET%', N'Олег', N'2025-01-01';
EXEC sp_InsertScheduleStacionar N'PV_521', N'%Объектно%', N'Олег', N'2025-02-10';
EXEC sp_SelectScheduleFor		N'PV_521';