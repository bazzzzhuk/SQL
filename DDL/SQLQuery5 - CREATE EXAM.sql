USE PV_521_ALL_IN_ONE;


CREATE TABLE Exams
(
	student		INT				CONSTRAINT FK_Exams_Students	FOREIGN KEY REFERENCES Students(student_id),
	discipline	SMALLINT		CONSTRAINT FK_Exams_Disciplines	FOREIGN KEY REFERENCES Disciplines(discipline_id),
	grade		TINYINT			CONSTRAINT CK_Exam_Grade				CHECK (grade > 0 AND grade <=12)
)
CREATE TABLE	HomeWorks
(
	[group]		INT				CONSTRAINT FK_HW_Groups			FOREIGN KEY REFERENCES Groups(group_id),
	lesson		INT				CONSTRAINT FK_HW_Schedule		FOREIGN KEY REFERENCES Schedule(lesson_id),
	[data]		VARBINARY(MAX),
	comment		NVARCHAR(1024),
	CONSTRAINT	CK_DATA_OR_COMMENT	CHECK ([data] IS NOT NULL OR comment IS NOT NULL),
	PRIMARY KEY([group],lesson)
)

CREATE TABLE	ResultsHW
(
	student		INT				CONSTRAINT FK_Results_Students	FOREIGN KEY REFERENCES Students(student_id),
	[group]		INT,				--CONSTRAINT FK_Results_Groups	FOREIGN KEY REFERENCES Groups(group_id),
	lesson		INT,				--CONSTRAINT FK_Results_Schedule	FOREIGN KEY REFERENCES Schedule(lesson_id),
	CONSTRAINT FK_Results_HW	FOREIGN KEY ([group],lesson)	REFERENCES HomeWorks([group],lesson),
	result		VARBINARY(MAX),
	comment		NVARCHAR(1024),
	grade		TINYINT			CONSTRAINT CK_HW_Grade CHECK (grade > 0 AND grade <= 12),		
	CONSTRAINT CK_RESULT_OR_COMMENT		CHECK ([result] IS NOT NULL OR comment IS NOT NULL),
	PRIMARY KEY(student,[group],lesson)
);