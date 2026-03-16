-- SQLQuery0 - CHECK.sql

USE PV_521_Import
SET DATEFIRST 1;

--DELETE FROM DaysOffTeachers WHERE [teacherOFF] = 1;

--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%ADO.NET%')

--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Сетевое программирование%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Объектно%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Процедурное%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Hardware-PC%')
--DELETE FROM Schedule WHERE discipline=(SELECT discipline_id FROM Disciplines	WHERE discipline_name LIKE N'%Теория баз данных, программирование MS SQL Server%')

--DELETE FROM Schedule WHERE [group] = 521 --AND [date]>=N'2026-03-07'
--EXEC sp_InsertSchedule1221 N'PV_521', N'Hardware%', N'Свищев',N'2025-01-20',1,3,5;
--DECLARE @bb AS BIT;
--IF EXISTS (SELECT lesson_id FROM Schedule WHERE [date] = N'2025-01-22' AND discipline = 31) SET @bb = 1 ELSE SET @bb = 0;
--PRINT @bb;
--EXEC sp_InsertSchedule1221 N'PV_521', N'%Windows', N'Свищев',N'2025-04-30',1,3,5;
--EXEC sp_InsertSchedule1221 N'PV_521', N'Процедурное%C++', N'Ковтун',N'2025-01-20',5,3,1;
--UPDATE Schedule SET teacher = 1 WHERE discipline =1;

--EXEC sp_InsertScheduleStacionar N'PV_521', N'%Объектно%', N'Олег', N'2025-02-13';
--EXEC sp_InsertScheduleStacionar N'PV_521', N'%MS SQL Server', N'Олег', N'2025-12-24';
--EXEC sp_InsertScheduleStacionar N'PV_521', N'%ADO.NET%', N'Олег', N'2026-02-04';
--EXEC sp_InsertScheduleStacionar N'PV_521', N'Сетевое%', N'Олег', N'2026-03-09';
--EXEC sp_InsertScheduleStacionar N'PV_521', N'Системное%', N'Олег', DEFAULT;
--EXEC sp_InsertScheduleStacionar N'PV_521', N'HTML/CSS', N'Олег', DEFAULT; 
--EXEC sp_InsertScheduleStacionar N'PV_521', N'JavaScript', N'Олег', DEFAULT;
--EXEC sp_InsertScheduleStacionar N'PV_521', N'ReactJS', N'Олег', DEFAULT;
--EXEC sp_InsertScheduleStacionar N'PV_521', N'%ASP.NET', N'Олег', DEFAULT;
--EXEC sp_InsertScheduleStacionar N'PV_521', N'%ADO.NET%', N'Олег', N'2026-01-21';
 
--EXEC sp_InsertScheduleStacionar N'PV_319', N'%ADO.NET%', N'Олег', N'2027-01-01';
--EXEC sp_InsertScheduleStacionar N'Java_326', N'%ADO.NET%', N'Олег', N'2024-12-20';
--EXEC sp_InsertScheduleStacionar N'PV_319', N'%Объектно%', N'Олег', N'2025-02-13';
--EXEC sp_SelectScheduleFor		N'PV_319';
--EXEC sp_SelectScheduleFor		N'Java_326';

--EXEC sp_1221_InsertSchedule N'PV_521', N'%ADO.NET%', N'Олег', N'2025-02-03', N'%Hardware-PC%', N'Свищев', N'2025-02-07';

EXEC sp_SelectScheduleFor		N'PV_521';