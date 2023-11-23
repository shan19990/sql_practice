# Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.
SELECT euni.unique_id, e.name FROM EmployeeUNI euni RIGHT JOIN Employees e ON euni.id = e.id;

# Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
SELECT p.product_name, s.year, s.price FROM Product p INNER JOIN Sales s ON p.product_id = s.product_id;

# Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
SELECT customer_id, COUNT(*) AS count_no_trans FROM Visits WHERE visit_id NOT IN (SELECT visit_id FROM Transactions) GROUP BY customer_id;

# Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).
SELECT w2.id FROM Weather w1, Weather w2 WHERE w2.temperature > w1.temperature AND DATEDIFF(w2.recordDate,w1.recordDate) = 1;

# Write a solution to report the name and bonus amount of each employee with a bonus less than 1000.
SELECT e.name , b.bonus FROM Employee e LEFT JOIN bonus b ON e.empId = b.empId WHERE b.bonus < 1000 OR b.bonus IS NULL;

# Write a solution to find the number of times each student attended each exam.
WITH cte AS(
SELECT s.student_id, s.student_name, su.subject_name FROM Students s CROSS JOIN Subjects su
)
SELECT cte.student_id, cte.student_name, cte.subject_name, COUNT(Examinations.student_id) AS attended_exams 
FROM cte LEFT JOIN Examinations
ON cte.student_id = Examinations.student_id AND cte.subject_name = Examinations.subject_name
GROUP BY student_id,subject_name
ORDER BY student_id;

# Write a solution to find managers with at least five direct reports.
SELECT e1.name FROM Employee e1 INNER JOIN Employee e2 ON e1.id = e2.managerId GROUP BY e1.id HAVING COUNT(e2.id) >= 5;

