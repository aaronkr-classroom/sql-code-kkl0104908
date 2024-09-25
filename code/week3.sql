/* CREATE DATABASE dju24; */

DROP TABLE teachers;

CREATE TABLE teachers(
	id bigserial,
	first_name varchar(25),
	last_name varchar(50),
	school varchar(50),
	hire_date date,
	salay numeric
);

INSERT INTO teachers (first_name, last_name, hire_date, salary)
	VALUES ('Janet', 'Smith', 'F.D.Roosevelt H.S.', '2011-10-30', 36200),
			('Lee', 'Reynolds', 'F.D.Roosevelt H.S.', '1993-05-22', 65000),
			('Samuel', 'Cole', 'Meyers M.S', '2005-08-01', 43500);

SELECT * from teachers;

TABLE teachers;

--weerk 3 Code

SELECT last_name, school, salary FROM teachers;

SELECT last_name, school, salary FROM teachers
	ORDER BY salary DESC;

SELECT last_name, school, salary FROM teachers
	ORDER BY 1 ASC;

SELECT DISTINCT school FROM teachers BY school;

--WHERE 문

SELECT last_name, school, salary FROM teachers
	ORDER BY salary DESC;

SELECT last_name, school, salary FROM teachers
	WHERE salary >= 40000
	ORDER BY salay DESC;

SELECT last_name, school, salary FROM teachers
	WHERE salary BETWEEN 20000 AND 40000
	ORDER BY salay DESC;

SELECT first_name, last_name, school, salary FROM teachers
	WHERE last_name ILIKE 's%' OR first_name ILIKE 's%'
	ORDER BY salay DESC;