-- SQLQuery0 - CHECK.sql

USE PV_521_Import
SET DATEFIRST 1;

--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%ADO.NET%')

--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Сетевое программирование%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Объектно%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Процедурное%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Hardware-PC%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Теория баз данных, программирование MS SQL Server%')

--DELETE FROM Schedule WHERE [group] = 521

--EXEC sp_InsertScheduleStacionar N'PV_521', N'%ADO.NET%', N'Олег', N'2025-01-01';
--EXEC sp_InsertScheduleStacionar N'PV_521', N'%Объектно%', N'Олег', N'2025-02-13';
EXEC sp_SelectScheduleFor		N'PV_521';

--EXEC sp_InsertScheduleStacionar N'PV_319', N'%ADO.NET%', N'Олег', N'2027-01-01';
--EXEC sp_InsertScheduleStacionar N'Java_326', N'%ADO.NET%', N'Олег', N'2024-12-20';
--EXEC sp_InsertScheduleStacionar N'PV_319', N'%Объектно%', N'Олег', N'2025-02-13';
--EXEC sp_SelectScheduleFor		N'PV_319';
--EXEC sp_SelectScheduleFor		N'Java_326';