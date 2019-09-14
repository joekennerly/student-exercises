CREATE TABLE Cohort (
    Id	   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name   TEXT NOT NULL UNIQUE
);

CREATE TABLE Exercise (
    Id	   INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    Name   TEXT NOT NULL UNIQUE
    LANGUAGE 
);

CREATE TABLE Student (
    Id	        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName   TEXT NOT NULL UNIQUE
    LastName    TEXT NOT NULL UNIQUE
    SlackHandle TEXT NOT NULL UNIQUE
    FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);

CREATE TABLE Instructor (
    Id	        INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    FirstName   TEXT NOT NULL UNIQUE
    LastName    TEXT NOT NULL UNIQUE
    SlackHandle TEXT NOT NULL UNIQUE
    Speciality  TEXT NOT NULL UNIQUE
    FOREIGN KEY(CohortId) REFERENCES Cohort(Id)
);