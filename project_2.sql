SELECT * FROM departments;
SELECT * FROM departments_dupli;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
    
# Hi Shankhanil! Thanks for working on this project for our team.
#Thanks again for joining last week’s meeting with the HR team. Your input as Data Analyst and SQL expert was very constructive.
# As you remember, the HR team has had trouble keeping track of the development of employee salaries because 
# they don’t have sufficient experience working with the MySQL database.
# Also, the queries they need to write to gain meaningful insights are beyond their skill level.
# I really liked your idea of setting up a view on the HR team's database that ensures easy access to these more complex queries!
# As this was your idea, I want to assign you this project.
# You now should have access to the HR team's database called “employees”. Please familiarize yourself with this database.
# You can also find a diagram of the database that they have provided attached to this email (employees_ER_diagram.pdf),
# which might help you to better understand their database.
# After that, please start by writing a query that includes the average of the current salaries grouped by departments.
# This was challenging for the HR team because there are a lot of historic salaries that are not relevant to this query.
# Additionally, they would also like to see the current salary of the respective manager of each department.
# Please store that query in a view called department_stats.
# Please, also feel free to clean the data to make it look nice for them if you should come across any suboptimal formatting,
# such as unnecessary quotes (“).
 
#AVG of each department and view
CREATE VIEW avg_salary_dept AS 
SELECT d.dept_no, d.dept_name, ROUND(AVG(s.salary),2) as avg_salary 
FROM employees e 
INNER JOIN salaries s ON e.emp_no = s.emp_no
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY avg_salary DESC;

SELECT * FROM avg_salary_dept;

#current salary of the respective manager of each department

CREATE VIEW manager_dept_salary AS 
SELECT e.emp_no, e.first_name, e.last_name, dm.dept_no, d.dept_name, t.title, s.salary
FROM employees e
INNER JOIN dept_manager dm ON e.emp_no = dm.emp_no
INNER JOIN departments d ON d.dept_no = dm.dept_no
INNER JOIN salaries s ON s.emp_no = e.emp_no
INNER JOIN titles t ON t.emp_no = e.emp_no
WHERE s.to_date = '9999-01-01' AND t.title = "Manager"
GROUP BY e.emp_no, e.first_name, e.last_name, dm.dept_no, d.dept_name, t.title, s.salary
ORDER BY s.salary DESC;

SELECT * FROM manager_dept_salary



