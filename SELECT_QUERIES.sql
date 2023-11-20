SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

# To find employees whoes first name is kellie and gender is F
SELECT * FROM employees WHERE first_name = 'Kellie' AND gender = 'F';

# Retrieve a list with all female employees whose first name is either Kellie or Aruna.
SELECT * FROM employees WHERE (first_name = 'Kellie' OR first_name = 'Aruna') AND gender = 'F';

# Use the IN operator to select all individuals from the “employees” table, whose first name is either “Denis”, or “Elvis”.
SELECT * FROM employees WHERE first_name IN ('Denis','Elvis');

# Extract all records from the ‘employees’ table, aside from those with employees named John, Mark, or Jacob.
SELECT * FROM employees WHERE first_name NOT IN ('John','Mark','Jacob');

# Working with the “employees” table, use the LIKE operator to select the data about all individuals, whose first name starts with “Mark”; specify that the name can be succeeded by any sequence of characters.
SELECT * FROM employees WHERE first_name LIKE 'Mark%';

# Retrieve a list with all employees who have been hired in the year 2000.
SELECT * FROM employees WHERE hire_date LIKE '2000%';

# Retrieve a list with all employees whose employee number is written with 5 characters, and starts with “1000”.
SELECT * FROM employees WHERE emp_no LIKE '1000_';

# Extract another list containing the names of employees that do not contain “Jack”.
SELECT * FROM employees WHERE first_name NOT LIKE '%Jack%';

# Select all the information from the “salaries” table regarding contracts from 66,000 to 70,000 dollars per year.
SELECT * FROM salaries WHERE salary BETWEEN 66000 AND 70000;

# Retrieve a list with all individuals whose employee number is not between ‘10004’ and ‘10012’.
SELECT * FROM employees WHERE emp_no NOT BETWEEN 10004 AND 10012;

# Select the names of all departments with numbers between ‘d003’ and ‘d006’.
SELECT * FROM departments WHERE dept_no BETWEEN 'd003' AND 'd006';

# Select the names of all departments whose department number value is not null.
SELECT dept_name FROM departments WHERE dept_no IS NOT NULL;

# Retrieve a list with data about all female employees who were hired in the year 2000 or after.
SELECT * FROM employees WHERE gender = 'F' AND YEAR(hire_date)>=2000;

# Extract a list with all employees’ salaries higher than $150,000 per annum.
SELECT * FROM salaries WHERE salary > 150000; 

# Obtain a list with all different “hire dates” from the “employees” table.
SELECT DISTINCT hire_date FROM employees;

# How many annual contracts with a value higher than or equal to $100,000 have been registered in the salaries table?
SELECT COUNT(*) FROM salaries WHERE salary>= 100000;

# How many managers do we have in the “employees” database? Use the star symbol (*) in your code to solve this exercise.
SELECT COUNT(*) FROM dept_manager;

# Select all data from the “employees” table, ordering it by “hire date” in descending order.
SELECT * FROM employees ORDER BY hire_date;

# 















