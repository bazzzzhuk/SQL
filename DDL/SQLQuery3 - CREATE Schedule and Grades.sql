--SQLQuery3 - CREATE Schedule and Grades.sql
USE PV_521_DDL
USE PV_521_ALL_IN_ONE

CREATE TABLE Schedule
(
	lesson_id	INT			PRIMARY KEY,
	[date]		DATE		NOT NULL,
	[time]		TIME		NOT NULL,
	[group]		INT			NOT NULL
	CONSTRAINT	FK_Schedule_Group		FOREIGN KEY REFERENCES Groups(group_id),
	discipline	SMALLINT	NOT NULL
	CONSTRAINT	FK_Schedule_Disciplines	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	teacher		INT			NOT NULL
	CONSTRAINT	FK_Schedule_Teachers	FOREIGN KEY REFERENCES Teachers(teacher_id),
	[subject]	NVARCHAR(256),
	[status]	BIT				
);

CREATE TABLE Grades
(
	student		INT			NOT NULL
	CONSTRAINT	FK_Schedule_Students	FOREIGN KEY REFERENCES Students(student_id),
	lesson		INT			NOT NULL
	CONSTRAINT	FK_Grades_Schedule		FOREIGN KEY REFERENCES Schedule(lesson_id),
	grade_1		TINYINT,
	grade_2		TINYINT,
);