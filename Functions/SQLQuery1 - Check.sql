-- SQLQuery1 - Check.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO


PRINT dbo.GetNextLearnDay(N'Java_326', '2026-03-04')
PRINT dbo.GetNextLearnDate(N'PV_521', '2026-03-08')