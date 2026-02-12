--SQLQuery00 CREATE DATABASE All in one.sql

--SELECT 'SQLQuery4 - CREATE DATABASE All in one'
----FROM DDL
--GO
--SELECT 'SQLQuery1 - CREATE Students branch'
--GO
--SELECT 'SQLQuery2 - CREATE Teachers and Disciplines'
--GO
--SELECT 'SQLQuery3 - CREATE Schedule and Grades'
--GO

----UNION ALL

--------------------------------------

CREATE DATABASE PV_521_ALL_IN_ONE
ON
(
	NAME		=	PV_521_ALL_IN_ONE,
	FILENAME	=	'L:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521_ALL_IN_ONE.mdf',
	SIZE		=	  8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH	=	  8 MB
)
LOG ON
(
	NAME		=	PV_521_ALL_IN_ONE_log,
	FILENAME	=	'L:\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\PV_521_ALL_IN_ONE_log.ldf',
	SIZE		=	  8 MB,
	MAXSIZE		=	500 MB,
	FILEGROWTH	=	  8 MB
)

--------------------------------------

--USE PV_521_DDL;
GO
USE PV_521_ALL_IN_ONE;

CREATE TABLE Directions
(
	direction_id		TINYINT			PRIMARY KEY,
	direction_name		NVARCHAR(150)	NOT NULL
);
CREATE TABLE Groups
(
	group_id		INT				PRIMARY KEY,
	group_name		NVARCHAR(24)	NOT NULL,
	direction		TINYINT			NOT NULL
	CONSTRAINT FK_Groups_Direction	FOREIGN KEY REFERENCES Directions(direction_id)
);
CREATE TABLE Students
(
	student_id		INT				PRIMARY KEY	IDENTITY(1,1),
	last_name		NVARCHAR(50)	NOT NULL,
	first_name		NVARCHAR(50)	NOT NULL,
	middle_name		NVARCHAR(50),
	birth_date		DATE			NOT NULL,
	--group - ключевое слово Transact-SQL, можно использовать их, но надо взять в скобки
	[group]			INT				NOT NULL
	CONSTRAINT	FK_Students_Group	FOREIGN KEY REFERENCES Groups(group_id)
);
--DROP TABLE Students, Groups, Directions;

---------------------------------------

CREATE TABLE Teachers
(
	teacher_id				INT				PRIMARY KEY,
	last_name				NVARCHAR(50)	NOT NULL,
	first_name				NVARCHAR(50)	NOT NULL,
	middle_name				NVARCHAR(50),
	birth_date				DATE			NOT NULL
);

CREATE TABLE Disciplines
(
	discipline_id			SMALLINT		PRIMARY KEY,
	discipline_name			NVARCHAR(256)	NOT NULL,
	number_of_lessons		TINYINT			NOT NULL
);

CREATE TABLE DisciplinesDirectionsRelation
(
	discipline				SMALLINT,
	direction				TINYINT,
	PRIMARY KEY (discipline, direction),
	CONSTRAINT FK_DDR_Discipline	FOREIGN KEY (discipline)			REFERENCES Disciplines(discipline_id),
	CONSTRAINT FK_DDR_Direction		FOREIGN KEY (direction)				REFERENCES Directions(direction_id)
);

CREATE TABLE TeachersDisciplinesRelation
(
	teacher					INT,
	discipline				SMALLINT,
	PRIMARY KEY(teacher, discipline),
	CONSTRAINT	FK_TDR_Teacher		FOREIGN KEY (teacher)				REFERENCES Teachers(teacher_id),
	CONSTRAINT	FK_TDR_Discipline	FOREIGN KEY	(discipline)			REFERENCES Disciplines(discipline_id)
);

CREATE TABLE RequiredDisciplines
(
	discipline				SMALLINT,
	required_discipline		SMALLINT,
	PRIMARY KEY(discipline, required_discipline),
	CONSTRAINT	FK_RD_Discipline	FOREIGN KEY (discipline)			REFERENCES Disciplines(discipline_id),
	CONSTRAINT	FK_RD_Required		FOREIGN KEY	(required_discipline)	REFERENCES Disciplines(discipline_id)
);

CREATE TABLE DependentDisciplines
(
	discipline				SMALLINT,
	dependent_discipline	SMALLINT,
	PRIMARY KEY(discipline, dependent_discipline),
	CONSTRAINT	FK_DD_Discipline	FOREIGN KEY (discipline)			REFERENCES Disciplines(discipline_id),
	CONSTRAINT	FK_DD_Dependent		FOREIGN KEY (dependent_discipline)	REFERENCES Disciplines(discipline_id)
);

-----------------------------------

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

