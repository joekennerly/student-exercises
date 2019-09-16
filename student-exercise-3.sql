CREATE TABLE Cohort (
    CohortId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL UNIQUE
);

CREATE TABLE Student_Exercise (
	StuExId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
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
    FOREIGN KEY(CohortId) REFERENCES Cohort(CohortId)
);

CREATE TABLE Instructor (
    InstId INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName TEXT NOT NULL UNIQUE,
    LastName TEXT NOT NULL UNIQUE,
    SlackHandle TEXT NOT NULL UNIQUE,
    Speciality TEXT NOT NULL UNIQUE,
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
INSERT INTO Instructor (InstId, Name)
VALUES 
	(null, "33")
	(null, "34"),
	(null, "35");

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Cohort;
SELECT * FROM Exercise;
SELECT * FROM Student_Exercise;
