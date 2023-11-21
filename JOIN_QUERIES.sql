SELECT * FROM departments;
SELECT * FROM departments_dupli;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

# If you currently have the ‘departments_dupli’ table set up, use DROP COLUMN to remove the ‘dept_manager’ column from the ‘departments_dup’ table.
# Then, use CHANGE COLUMN to change the ‘dept_no’ and ‘dept_name’ columns to NULL.

ALTER TABLE departments_dupli DROP COLUMN dept_manager ;

ALTER TABLE departments_dupli
CHANGE COLUMN dept_no dept_no CHAR(4) NULL;

ALTER TABLE departments_dupli
CHANGE COLUMN dept_name dept_name VARCHAR(40) NULL;

# Create and fill in the ‘dept_manager_dup’ table, using the following code:

DROP TABLE IF EXISTS dept_manager_dup;
CREATE TABLE dept_manager_dup (
  emp_no int(11) NOT NULL,
  dept_no char(4) NULL,
  from_date date NOT NULL,
  to_date date NULL
  );

INSERT INTO dept_manager_dup
select * from dept_manager;

INSERT INTO dept_manager_dup (emp_no, from_date)
VALUES                (999904, '2017-01-01'),
                                (999905, '2017-01-01'),
                               (999906, '2017-01-01'),
                               (999907, '2017-01-01');

DELETE FROM dept_manager_dup
WHERE
    dept_no = 'd001';
    
# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date. 

SELECT dm.emp_no, e.first_name, e.last_name, dm.dept_no, e.hire_date FROM dept_manager dm INNER JOIN employees e
ON dm.emp_no = e.emp_no;

# Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees whose last name is Markovitch.
# See if the output contains a manager with that name.  

SELECT e.*, dm.* FROM employees e LEFT JOIN dept_manager dm ON e.emp_no=dm.emp_no WHERE e.last_name = 'Markovitch';

# Extract a list containing information about all managers’ employee number, first and last name, department number, and hire date.

SELECT m.emp_no, e.first_name, e.last_name , m.dept_no, e.hire_date FROM dept_manager m INNER JOIN employees e ON m.emp_no = e.emp_no;

# Select the first and last name, the hire date, and the job title of all employees whose first name is “Margareta” and have the last name “Markovitch”.

SELECT e.first_name, e.last_name, e.hire_Date , t.title FROM employees e INNER JOIN titles t ON e.emp_no=t.emp_no 
WHERE e.first_name = 'Margareta' AND e.last_name = 'Markovitch' ;

# Use a CROSS JOIN to return a list with all possible combinations between managers from the dept_manager table and department number 9.

SELECT d.* , dm.* FROM dept_manager dm JOIN departments d WHERE d.dept_no = 'd009';

# Select all managers’ first and last name, hire date, job title, start date, and department name.

SELECT e.first_name , e.last_name , e.hire_date , t.title , dm.from_date, dm.dept_no 
FROM employees e 
JOIN dept_manager dm ON e.emp_no = dm.emp_no
JOIN titles t ON t.emp_no = dm.emp_no
WHERE t.title = 'Manager'
ORDER BY e.emp_no;

# How many male and how many female managers do we have in the ‘employees’ database?

SELECT COUNT(*) ,e.gender 
FROM employees e  
INNER JOIN titles t ON t.emp_no = e.emp_no
WHERE title = 'Manager'
GROUP BY gender;








