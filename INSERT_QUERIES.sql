SELECT * FROM departments;
SELECT * FROM dept_emp;
SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM titles;

# Select ten records from the “titles” table to get a better idea about its content.
# Then, in the same table, insert information about employee number 999903. State that he/she is a “Senior Engineer”,
# who has started working in this position on October 1st, 1997.
# At the end, sort the records from the “titles” table in descending order to check if you have successfully inserted the new record.

SELECT * FROM titles ORDER BY emp_no DESC LIMIT 10;
INSERT INTO titles (emp_no,title,from_date) VALUES(999903, "Senior Engineer",'1997-10-01');

# Insert information about the individual with employee number 999903 into the “dept_emp” table.
# He/She is working for department number 5, and has started work on  October 1st, 1997; her/his contract is for an indefinite period of time.

INSERT INTO dept_emp (emp_no,dept_no,from_date,to_date) VALUES (999903, 'd005', '1997-10-01', '9999-12-31');

# Create a new department called “Business Analysis”. Register it under number ‘d010’.

INSERT INTO departments VALUES("d010","Business Analysis");

# Create a departments_dupli table and add all values from departments to it

CREATE TABLE departments_dupli(
	dept_no CHAR(4),
    dept_name VARCHAR(40)
);

INSERT INTO departments_dupli(
	dept_no,
    dept_name
)
SELECT * FROM departments;









