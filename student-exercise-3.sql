CREATE TABLE Cohort (
    CohortId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE
);

CREATE TABLE Student_Exercise (
	Id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	StudentId INTEGER NOT NULL,
    ExerciseId INTEGER NOT NULL,
    FOREIGN KEY(StudentId) REFERENCES Student(StudentId),
    FOREIGN KEY(ExerciseId) REFERENCES Exercise(ExerciseId)
);

CREATE TABLE Exercise (
    ExerciseId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE,
    Lang TEXT NOT NULL UNIQUE 
);

CREATE TABLE Student (
    StudentId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL UNIQUE,
    LastName TEXT NOT NULL UNIQUE,
    SlackHandle TEXT NOT NULL UNIQUE,
    CohortId INTEGER NOT NULL,
    FOREIGN KEY(CohortId) REFERENCES Cohort(CohortId)
);

ALTER TABLE Student 
ADD CohortId INT FOREIGN KEY;

CREATE TABLE Instructor (
    InstId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL UNIQUE,
    LastName TEXT NOT NULL UNIQUE,
    SlackHandle TEXT NOT NULL UNIQUE,
    Speciality TEXT NOT NULL UNIQUE,
    CohortId INTEGER NOT NULL,
    FOREIGN KEY(CohortId) REFERENCES Cohort(CohortId)
);

-- Add 3 Cohorts
INSERT INTO Cohort (CohortId, Name)
VALUES 
	(null, "33"),
	(null, "34"),
	(null, "35");

-- Add 5 Exercises
-- Does not work because repeating values for lang
INSERT INTO Exercise (ExerciseId, Name, Lang)
VALUES 
	(null, "Kandy Korner", "JavaScript"),
	(null, "Student Exercises", "SQL"),
	(null, "Flex Blox", "CSS"),
	(null, "TBD", "Django"),
	(null, "Chicken Money", "Python");

-- Add 3 Instructors
INSERT INTO Instructor (InstId, FirstName, LastName, SlackHandle, Speciality, CohortId)
VALUES 
	(null, "Joe", "Shep", "JoeS", "Dad Jokes", 1),
	(null, "Steve", "Brownlee", "Coach", "Everything",2),
	(null, "Leah", "Hoefling", "Leah", "SQL", 3);

DROP TABLE Student_Exercise;

-- Add 7 Students
INSERT INTO Student (StudentId, FirstName, LastName, SlackHandle, CohortId)
VALUES 
	(null, "eoj", "d", "orgkenenn", 1),
	(null, "Bab", "Ba", "aj", 2),
	(null, "James", "Ga", "jahk", 3);

INSERT INTO Student_Exercise (Id, StudentId, ExerciseId)
VALUES
	(null, 1, 1),
	(null, 1, 2),
	(null, 2, 1),
	(null, 2, 3),
	(null, 3, 1),
	(null, 3, 4),
	(null, 4, 1),
	(null, 4, 5),
	(null, 5, 1),
	(null, 5, 6);

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Cohort;
SELECT * FROM Exercise;
SELECT * FROM Student_Exercise;
