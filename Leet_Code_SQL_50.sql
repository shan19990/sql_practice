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

# Write a solution to find the confirmation rate of each user.
SELECT s.user_id, ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END),2) AS confirmation_rate FROM Signups s LEFT JOIN Confirmations c 
ON s.user_id = c.user_id GROUP BY s.user_id;

# Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".
SELECT * FROM Cinema WHERE id%2=1 AND description <> "boring" ORDER BY rating DESC;

# Write a solution to find the average selling price for each product. average_price should be rounded to 2 decimal places
SELECT p.product_id , 
ROUND(IFNULL((SUM(CASE WHEN u.purchase_date BETWEEN p.start_date AND p.end_date THEN p.price*u.units ELSE 0 END)/SUM(CASE WHEN u.purchase_date BETWEEN p.start_date AND p.end_date THEN u.units END)),0),2) AS average_price
FROM Prices p LEFT JOIN UnitsSold u ON p.product_id = u.product_id GROUP BY p.product_id;

# Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.
SELECT p.project_id , ROUND(AVG(e.experience_years),2) AS average_years FROM Project p INNER JOIN Employee e ON p.employee_id = e.employee_id GROUP BY p.project_id;

# Write a solution to find the percentage of the users registered in each contest rounded to two decimals
SELECT contest_id, ROUND(((COUNT(user_id)/(SELECT COUNT(*) FROM Users))*100.0),2) AS percentage FROM Register r GROUP BY r.contest_id ORDER BY percentage DESC,contest_id;

# Write a solution to find each query_name, the quality and poor_query_percentage.
SELECT query_name, ROUND(SUM(rating/position)/COUNT(query_name) ,2) AS quality,
ROUND(COUNT(CASE WHEN rating<3 THEN 1 END)/COUNT(query_name) *100.0 ,2) AS poor_query_percentage FROM Queries GROUP BY query_name;

# Write an SQL query to find for each month and country, the number of transactions and their total amount, the number of approved transactions and their total amount.
SELECT SUBSTRING(trans_date,1,7) AS month, country, COUNT(1) AS trans_count, 
IFNULL(SUM(CASE WHEN state = "approved" THEN 1 END) ,0) AS approved_count,
SUM(amount) AS trans_total_amount,
IFNULL(SUM(CASE WHEN state = "approved" THEN amount END) ,0) AS approved_total_amount 
FROM Transactions GROUP BY month,country;

# Write a solution to find the percentage of immediate orders in the first orders of all customers, rounded to 2 decimal places.
SELECT ROUND(SUM(CASE WHEN customer_pref_delivery_date = order_date THEN 1 ELSE 0 END)/COUNT(DISTINCT customer_id)*100 ,2) AS immediate_percentage FROM Delivery WHERE (customer_id,order_date) IN (SELECT customer_id, MIN(order_date) FROM Delivery GROUP BY customer_id);

# Write a solution to calculate the number of unique subjects each teacher teaches in the university.
SELECT teacher_id, COUNT(DISTINCT subject_id) AS cnt FROM Teacher GROUP BY teacher_id;

# Write a solution to find the daily active user count for a period of 30 days ending 2019-07-27 inclusively. A user was active on someday if they made at least one activity on that day
SELECT activity_date AS day, COUNT(DISTINCT user_id) AS active_users FROM Activity WHERE activity_date BETWEEN '2019-06-28' AND '2019-07-27' GROUP BY activity_date;

# Write a solution to select the product id, year, quantity, and price for the first year of every product sold.
SELECT product_id, year AS first_year , quantity, price FROM Sales WHERE (product_id,year) IN (SELECT product_id, MIN(year) FROM Sales GROUP BY product_id);

# Write a solution to find all the classes that have at least five students.
SELECT class FROM Courses GROUP BY class HAVING Count(student) >= 5;

# Write a solution that will, for each user, return the number of followers.
SELECT user_id, COUNT(follower_id) AS followers_count FROM Followers GROUP BY user_id ORDER BY user_id;

# Find the largest single number. If there is no single number, report null.
SELECT MAX(num) AS num FROM MyNumbers WHERE num IN (
SELECT num FROM MyNumbers GROUP BY num HAVING COUNT(num) = 1);

# Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.
SELECT customer_id  FROM Customer GROUP BY customer_id HAVING COUNT(DISTINCT product_key)/(SELECT COUNT(*) FROM Product) = 1;

# Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.
SELECT e1.employee_id,e1.name,COUNT(e2.employee_id) AS reports_count, ROUND(AVG(e2.age)) AS average_age FROM Employees e1 INNER JOIN Employees e2 ON e1.employee_id = e2.reports_to GROUP BY e1.employee_id ORDER BY e1.employee_id;

# Write a solution to report all the employees with their primary department. For employees who belong to one department, report their only department.
SELECT employee_id,department_id FROM Employee WHERE primary_flag = "Y"
UNION
SELECT employee_id,department_id FROM Employee GROUP BY employee_id HAVING COUNT(employee_id)=1;

# Report for every three line segments whether they can form a triangle.
SELECT x,y,z, CASE WHEN x+y>z AND x+z>y AND y+z>x THEN "Yes" ELSE "No" END AS triangle FROM Triangle;















