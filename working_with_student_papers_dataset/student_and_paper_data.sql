-- CREATING THE STUDENT TABLE
CREATE TABLE students(
  id int AUTO_INCREMENT PRIMARY KEY,
  first_name varchar(100)
);
-- CREATING THE PAPER TABLE
CREATE TABLE papers(
  title varchar(100),
  grade int,
  student_id int,
  FOREIGN KEY(student_id) REFERENCES students(id) on delete cascade
);

-- INSERTING THE DATA

INSERT INTO students (first_name) VALUES 
('Caleb'), 
('Samantha'), 
('Raj'), 
('Carlos'), 
('Lisa');

INSERT INTO papers (student_id, title, grade ) VALUES
(1, 'My First Book Report', 60),
(1, 'My Second Book Report', 75),
(2, 'Russian Lit Through The Ages', 94),
(2, 'De Montaigne and The Art of The Essay', 98),
(4, 'Borges and Magical Realism', 89);


--GETTING THE AVERAGE GRADE OF ALL STUDENT

SELECT first_name, 
ifnull(avg(grade), 0) as average
FROM students
LEFT JOIN papers
on students.id = papers.student_id
GROUP by first_name
ORDER by average DESC;


-- CHECKING THE PASSING GRADE FOR THE STUDENT

SELECT first_name, 
ifnull(avg(grade), 0) as average,
CASE
WHEN avg(grade) > 70 then "PASSING"
ELSE "FAILING"
END AS Passing_status
FROM students
LEFT JOIN papers
on students.id = papers.student_id
GROUP by first_name
ORDER by average DESC;