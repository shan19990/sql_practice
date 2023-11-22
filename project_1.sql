SELECT * FROM departments;
SELECT * FROM departments_dupli;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;
    
# Hi Shankhanil! Thanks for working on this project for our team.
# As a valued member of our team at PaperPro, your role is vital in our efforts to reduce operating costs, specifically labor expenses.
# To minimize the impact of personnel reductions while maximizing benefits, we must carefully analyze labor costs in each department.
# This analysis requires a deep understanding of our HR systems' employee database.
# Your task is to acquire detailed labor cost information by creating queries based on the provided entity-relationship diagram.
# The objective is to compare labor costs across departments.
# Your queries should calculate total salaries paid by department and quarter during the current month. Note that the information on salaries
# and the relationship employee-department is indicated by start date and end date. Please utilize the provided resources to complete this
# project. Your expertise in querying our databases is crucial to achieving our cost reduction objectives.;
# Write an SQL query that summarizes the salaries grouping by dept_no and dept_name.

SELECT d.dept_no, d.dept_name, SUM(s.salary) as total_salary
FROM employees e 
INNER JOIN salaries s ON e.emp_no = s.emp_no
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE s.to_date = '9999-01-01'
GROUP BY d.dept_no, d.dept_name
ORDER BY total_salary DESC;
 

