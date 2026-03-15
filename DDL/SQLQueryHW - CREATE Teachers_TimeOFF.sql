--SQLQueryHW - CREATE Teachers_TimeOFF.sql
--USE PV_521_DDL;
--USE PV_521_ALL_IN_ONE;
USE PV_521_Import;

CREATE TABLE TeachersOFF
(
	off_id		INT			PRIMARY KEY,
	teacher		SMALLINT	NOT NULL
	CONSTRAINT	FK_TeachersOFF_Teachers	FOREIGN KEY REFERENCES Teachers(teacher_id),
	dateOFF		DATE		NOT NULL,
	duration	TINYINT
);

--CREATE TABLE DaysOffTeachers
--(
--	teacherOFF	SMALLINT	NOT NULL
--	CONSTRAINT	FK_DOT_Teachers	FOREIGN KEY REFERENCES Teachers(teacher_id),
--	[date]		DATE		NOT NULL
--);