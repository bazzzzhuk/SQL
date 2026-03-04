-- SQLQueryHW - nextDATE.sql

USE PV_521_Import;
SET DATEFIRST 1;
GO

CREATE OR ALTER FUNCTION GetNextLearningDate(@prevDate AS DATE, @group_name	AS NCHAR(10))RETURNS DATE
AS
BEGIN
	DECLARE	@day	AS TINYINT	=	DATEPART(WEEKDAY, @prevDate);
	DECLARE @nextLearnDay	AS TINYINT	=	dbo.GetNextLearnDay(@group_name,@prevDate );

	SET		@prevDate			=	DATEADD	(DAY,IIF(@day > @nextLearnDay, 7-@day+@nextLearnDay, @nextLearnDay - @day),@prevDate);
	RETURN	@prevDate ;
END