import sqlite3

class Student:
    def __init__(self, first, last, handle, cohort):
        self.first_name = first
        self.last_name = last
        self.slack_handle = handle
        self.cohort = cohort

class StudentExerciseReports:

    """Methods for reports on the Student Exercises database"""

    def create_student(self, cursor, row):
        return Student(row[1], row[2], row[3], row[5])

    def __init__(self):
        self.db_path = "/Users/Joe/workspace/sql/student-exercises/student.db"

    def all_students(self):

        """Retrieve all students with the cohort name"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = self.create_student

            db_cursor = conn.cursor()

            db_cursor.execute("""
            select s.StudentId,
                s.FirstName,
                s.LastName,
                s.SlackHandle,
                s.CohortId,
                c.Name
            from Student s
            join Cohort c on s.CohortId = c.CohortId
            order by s.CohortId
            """)

            all_students = db_cursor.fetchall()

            for student in all_students:
                print(f'{student.first_name} {student.last_name} is in {student.cohort}')

reports = StudentExerciseReports()
reports.all_students()