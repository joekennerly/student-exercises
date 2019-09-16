CREATE TABLE Cohort (
    CohortId	   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name   TEXT NOT NULL UNIQUE
);

CREATE TABLE Exercise (
    ExerciseId	   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name   TEXT NOT NULL UNIQUE,
    Lang   TEXT NOT NULL UNIQUE 
);

CREATE TABLE Student (
    StudentId	        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName   TEXT NOT NULL UNIQUE
    LastName    TEXT NOT NULL UNIQUE
    SlackHandle TEXT NOT NULL UNIQUE
    FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);

CREATE TABLE Instructor (
    InstId      INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName   TEXT NOT NULL UNIQUE,
    LastName    TEXT NOT NULL UNIQUE,
    SlackHandle TEXT NOT NULL UNIQUE,
    Speciality  TEXT NOT NULL UNIQUE,
    FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);

-- Add 3 Cohorts
INSERT INTO Cohort (Id, Name)
VALUES 
	(null, "33")
	(null, "34"),
	(null, "35");

-- Add 5 Exercises
-- Does not work because repeating values for lang
INSERT INTO Exercise (Id, Name, Lang)
VALUES 
	(null, "Kandy Korner", "JavaScript"),
	(null, "Kennel", "JavaScript"),
	(null, "Miffles", "Javascript"),
	(null, "Planet List", "Python"),
	(null, "Chicken Money", "Python");

-- Add 3 Instructors
INSERT INTO Instructor (Id, Name)
VALUES 
	(null, "33")
	(null, "34"),
	(null, "35");

SELECT * FROM Student;
SELECT * FROM Instructor;
SELECT * FROM Cohort;
SELECT * FROM Exercise;
