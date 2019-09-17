import sqlite3

class Instructor:
    def __init__(self, first, last, handle, special, cohort):
        self.first_name = first
        self.last_name = last
        self.slack_handle = handle
        self.special = special
        self.cohort = cohort

    def __repr__(self):
        return f'instructor: {self.first_name} {self.last_name} is in {self.cohort}'

class Student:
    def __init__(self, first, last, handle, cohort):
        self.first_name = first
        self.last_name = last
        self.slack_handle = handle
        self.cohort = cohort

    def __repr__(self):
        return f'student: {self.first_name} {self.last_name} is in {self.cohort}'

class Cohort:
    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return f'cohort: {self.name}'

class Exercise:
    def __init__(self, name, lang):
        self.name = name
        self.lang = lang

    def __repr__(self):
        return f'exercise: {self.name} in {self.lang}'

class StudentExercise:
    def __init__(self, exercise, first, last):
        self.exercise = exercise
        self.student_first = first
        self.student_last = last

    def __repr__(self):
        return f'{self.exercise} \n\t*{self.student_first} {self.student_last} '

class StudentExerciseReports:

    """Methods for reports on the Student Exercises database"""

    def __init__(self):
        self.db_path = "/Users/Joe/workspace/sql/student-exercises/student.db"

    def all_cohorts(self):

        """Retrieve all cohorts"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Cohort(row[0])

        db_cursor = conn.cursor()

        db_cursor.execute("""
        select c.Name
        from Cohort c
        """)

        all_cohorts = db_cursor.fetchall()

        for cohort in all_cohorts:
            print(cohort)

    def all_exercises(self):

        """Retrieve all exercises"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Exercise(
                row[0], row[1]
            )

        db_cursor = conn.cursor()

        db_cursor.execute("""
        select e.Name, e.Lang
        from Exercise e
        """)

        all_exercises = db_cursor.fetchall()

        for exercise in all_exercises:
            print(exercise)

    def all_js_exercises(self):

        """Retrieve all js exercises"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Exercise(
                row[0], row[1]
            )

        db_cursor = conn.cursor()

        db_cursor.execute("""
        select e.Name, e.Lang
        from Exercise e
        where e.Lang = "JavaScript"
        """)

        all_exercises = db_cursor.fetchall()

        for exercise in all_exercises:
            print(exercise)

    def all_py_exercises(self):

        """Retrieve all python exercises"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Exercise(
                row[0], row[1]
            )

        db_cursor = conn.cursor()

        db_cursor.execute("""
        select e.Name, e.Lang
        from Exercise e
        where e.Lang = "Python"
        """)

        all_exercises = db_cursor.fetchall()

        for exercise in all_exercises:
            print(exercise)

    def all_css_exercises(self):

        """Retrieve all css sharp exercises"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Exercise(
                row[0], row[1]
            )

        db_cursor = conn.cursor()

        db_cursor.execute("""
        select e.Name, e.Lang
        from Exercise e
        where e.Lang = "CSS"
        """)

        all_exercises = db_cursor.fetchall()

        for exercise in all_exercises:
            print(exercise)


    def all_students(self):

        """Retrieve all students with the cohort name"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Student(
                row[1], row[2], row[3], row[5]
            )

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
                print(student)

    def all_instructors(self):

        """Retrieve all instuctors with the cohort name"""

        with sqlite3.connect(self.db_path) as conn:
            conn.row_factory = lambda cursor, row: Instructor(
                row[1], row[2], row[3], row[5], row[6]
            )

            db_cursor = conn.cursor()

            db_cursor.execute("""
            select i.InstId,
                i.FirstName,
                i.LastName,
                i.SlackHandle,
                i.Speciality,
                i.CohortId,
                c.Name
            from Instructor i
            join Cohort c on i.CohortId = c.CohortId
            order by i.CohortId
            """)

            all_instructors = db_cursor.fetchall()

            for instructor in all_instructors:
                print(instructor)

    def all_student_exercises(self):

        """Retrieve all exercises with a list of students"""

        exercises = dict()

        with sqlite3.connect(self.db_path) as conn:

            db_cursor = conn.cursor()

            db_cursor.execute("""
            select
                e.ExerciseId,
                e.Name,
                s.StudentId,
                s.FirstName,
                s.LastName
            from Exercise e
            join Student_Exercise se on se.ExerciseId = e.ExerciseId
            join Student s on s.StudentId = se.StudentId
            """)

            all_student_exercises = db_cursor.fetchall()

            for row in all_student_exercises:
                exercise_id = row[0]
                exercise_name = row[1]
                student_id = row[2]
                student_name = f'{row[3]} {row[4]}'

                if exercise_name not in exercises:
                    exercises[exercise_name] = [student_name]
                else:
                    exercises[exercise_name].append(student_name)

            for exercise_name, students in exercises.items():
                print(exercise_name)
                for student in students:
                    print(f'\t* {student}')

reports = StudentExerciseReports()
# reports.all_cohorts()
# reports.all_exercises()
# reports.all_students()
# reports.all_instructors()
# reports.all_js_exercises()
# reports.all_py_exercises()
# reports.all_css_exercises()
reports.all_student_exercises()