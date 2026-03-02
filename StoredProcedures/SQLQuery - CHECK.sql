-- SQLQuery0 - CHECK.sql

USE PV_521_Import
SET DATEFIRST 1;

--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%ADO.NET%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Объектно%')

EXEC sp_InsertScheduleStacionar N'PV_521', N'%ADO.NET%', N'Олег', N'2025-01-01';
--EXEC sp_InsertScheduleStacionar N'PV_521', N'%Объектно%', N'Олег', N'2025-06-21';
EXEC sp_SelectScheduleFor N'PV_521';