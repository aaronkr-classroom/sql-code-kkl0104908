--1. 테이블 생성하기

---1)course
CREATE TABLE course (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    teacher_id INT
);
INSERT INTO course (id, name, teacher_id) VALUES
(1, 'Database design', 1),
(2, 'English literature', 2),
(3, 'Python programming', 1);

---2)teacher
CREATE TABLE teacher (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
INSERT INTO teacher (id, first_name, last_name) VALUES
(1, 'Taylah', 'Booker'),
(2, 'Sarah-Louise', 'Blake');

---3)student
CREATE TABLE student (
    id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);
INSERT INTO student (id, first_name, last_name) VALUES
(1, 'Shreya', 'Bain'),
(2, 'Rianna', 'Foster'),
(3, 'Yosef', 'Naylor');

---4)student_course
CREATE TABLE student_course (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id)
);
INSERT INTO student_course (student_id, course_id) VALUES
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
(3, 1);


--2.테이블 조인하기

---1)student 테이블을 student_course에 조인하세요
SELECT s.first_name, s.last_name, sc.course_id
FROM student s
JOIN student_course sc ON s.id = sc.student_id;

---2)teacher 테이블을 course에 조인하세요
SELECT c.name AS course_name, t.first_name, t.last_name
FROM course c
JOIN teacher t ON c.teacher_id = t.id;

---3)course 테이블을 student_course에 조인하세요
SELECT sc.student_id, c.name AS course_name
FROM student_course sc
JOIN course c ON sc.course_id = c.id;


--3.데이터 살펴보기

---1)데이터베이스 설계 (Database Design)에 등록한 모든 학생의 이름을 표시합니다.
SELECT s.first_name, s.last_name
FROM student s
JOIN student_course sc ON s.id = sc.student_id
JOIN course c ON sc.course_id = c.id
WHERE c.name = 'Database design';

---2)Taylah Brooker가 가르친 모든 과정을 표시합니다.
SELECT c.name AS course_name
FROM course c
JOIN teacher t ON c.teacher_id = t.id
WHERE t.first_name = 'Taylah' AND t.last_name = 'Booker';

---3)성이 "B"로 시작하는 모든 학생과 교사를 표시합니다.
---- 성이 "B"로 시작하는 모든 학생
SELECT 'Student' AS role, s.first_name, s.last_name
FROM student s
WHERE s.last_name LIKE 'B%'

UNION

---- 성이 "B"로 시작하는 모든 교사
SELECT 'Teacher' AS role, t.first_name, t.last_name
FROM teacher t
WHERE t.last_name LIKE 'B%';