--1. Selezionare tutti gli studenti nati nel 1990 (160)
SELECT *
FROM students
WHERE YEAR(date_of_birth) = 1990;

--2. Selezionare tutti i corsi che valgono più di 10 crediti (479)
SELECT *
FROM courses
WHERE cfu>10;

--3. Selezionare tutti gli studenti che hanno più di 30 anni
SELECT *
FROM students
WHERE YEAR(date_of_birth) <= YEAR(CURDATE()) - 30;

--4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
--laurea (286)
SELECT *
FROM courses
WHERE year = 1
AND period = 'I semestre';

--5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
--20/06/2020 (21)
SELECT *
FROM exams
WHERE hour > '14:00:00'
AND date = '2020-06-20';

--6. Selezionare tutti i corsi di laurea magistrale (38)
SELECT *
FROM degrees
WHERE level='magistrale';

--7. Da quanti dipartimenti è composta l'università? (12)
SELECT *
FROM departments

--8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)
SELECT *
FROM teachers
WHERE phone IS NULL;



--1. Contare quanti iscritti ci sono stati ogni anno
SELECT YEAR(enrolment_date) AS year, COUNT(*) AS total_students
FROM students
GROUP BY YEAR(enrolment_date)
ORDER BY year;

--2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT office_address, COUNT(*) AS total_teachers
FROM teachers
GROUP BY office_address

--3. Calcolare la media dei voti di ogni appello d'esame
SELECT exam_id,  AVG(vote) AS average_grade
FROM exam_student
GROUP BY exam_id;

--4. Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT department_id, COUNT(*) AS total_degree_courses
FROM degrees
GROUP BY department_id;


--ESERCIZI CON INNER JOIN

--1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*
FROM degrees
INNER JOIN students ON students.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia';
