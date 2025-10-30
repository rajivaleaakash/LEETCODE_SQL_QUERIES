/*
QUESTION LINK
https://leetcode.com/problems/recyclable-and-low-fat-products/?envType=study-plan-v2&envId=top-sql-50

Question 1757
Write a solution to find the ids of products that are both low fat and recyclable.Return the result table in any order
*/
SELECT 
product_id
FROM Products
WHERE low_fats = 'Y' OR recyclable = 'N';


/*
QUESTION LINK
https://leetcode.com/problems/find-customer-referee/?envType=study-plan-v2&envId=top-sql-50

QUESTION 584
Write a solution to find the names of customers who were not referred by the customer with id = 2. Return the result table in any order.
*/
SELECT
name
FROM
Customer
WHERE
referee_id IS NULL OR referee_id != 2;

/*
QUESTION LINK
https://leetcode.com/problems/big-countries/?envType=study-plan-v2&envId=top-sql-50

QUESTION 595
Write a solution to find the names of the countries with either an area of at least 3,000,000 or a population of at least 25,000,000. Return the result table in any order.
*/
SELECT
name
FROM
Country
WHERE
area >= 3000000 OR population >= 25000000;

/*
QUESTION LINK
https://leetcode.com/problems/article-views-i/?envType=study-plan-v2&envId=top-sql-50

QUESTION 1148
Write a solution to find all the authors that viewed at least one of their own articles.Return the result table sorted by id in ascending order
*/

SELECT 
DISTINCT author_id AS id
FROM Views
WHERE author_id = viewer_id
ORDER BY author_id ASC;

/*
QUESTION LINK
https://leetcode.com/problems/invalid-tweets/description/?envType=study-plan-v2&envId=top-sql-50

QUESTION 1683
Write a solution to find the IDs of the invalid tweets. 
The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.
*/
SELECT 
tweet_id
FROM Tweets
WHERE length(content) > 15;

/*
QUESTION LINK
https://leetcode.com/problems/replace-employee-id-with-the-unique-identifier/description/?envType=study-plan-v2&envId=top-sql-50

QUESTION 1378
Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null
*/

SELECT 
unique_id,
name
FROM EmployeeUNI e1
RIGHT JOIN Employees e2
ON e1.id = e2.id;

/*
QUESTION LINK
https://leetcode.com/problems/product-sales-analysis-i/description/?envType=study-plan-v2&envId=top-sql-50

QUESTION 1068
Write a solution to report the product_name, year, and price for each sale_id in the Sales table.
*/
SELECT 
product_name,
year,
price
FROM Product p
JOIN Sales s
ON p.product_id = s.product_id;

/*
QUESTION LINK
https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/?envType=study-plan-v2&envId=top-sql-50

QUESTION 1581
Write a solution to find the IDs of the users who visited without making any transactions and the number of times they made these types of visits.
*/
SELECT 
customer_id,
COUNT(visit_id) AS count_no_trans
FROM Visits 
WHERE visit_id NOT IN (SELECT visit_id FROM Transactions)
GROUP BY customer_id;

/*
QUESTION LINK
https://leetcode.com/problems/rising-temperature/description/?envType=study-plan-v2&envId=top-sql-50

QUESTION 197
Write a solution to find all dates' id with higher temperatures compared to its previous dates (yesterday).
*/
SELECT 
W1.id
FROM Weather W1, Weather W2
WHERE DATEDIFF(W1.recordDate, W2.recordDate) = 1
AND W1.temperature > W2.temperature;

/*
QUESTION LINK
https://leetcode.com/problems/average-time-of-process-per-machine/description/?envType=study-plan-v2&envId=top-sql-50

QUESTION 1661
There is a factory website that has several machines each running the same number of processes. 
Write a solution to find the average time each machine takes to complete a process.
The time to complete a process is the 'end' timestamp minus the 'start' timestamp. 
The average time is calculated by the total time to complete every process on the machine divided by the number of processes that were run.
The resulting table should have the machine_id along with the average time as processing_time, which should be rounded to 3 decimal places.
*/
SELECT 
a1.machine_id,
ROUND(AVG(a2.timestamp - a1.timestamp),3) as processing_time
FROM Activity a1
JOIN Activity a2
ON a1.machine_id = a2.machine_id 
AND a1.process_id = a2.process_id
AND a1.activity_type = 'start' 
AND a2.activity_type = 'end'
GROUP BY a1.machine_id;

/*
QUESTION LINK
https://leetcode.com/problems/employee-bonus/?envType=study-plan-v2&envId=top-sql-50

QUESTION 577
Write a solution to report the name and bonus amount of each employee with a bonus less than 1000
*/
SELECT 
name,
bonus
FROM Employee e
LEFT JOIN Bonus b
ON e.empID = b.empID
WHERE bonus < 1000 OR bonus IS NULL;

/*
QUESTION LINK
https://leetcode.com/problems/students-and-examinations/?envType=study-plan-v2&envId=top-sql-50

QUESTION 1280
Write a solution to find the number of times each student attended each exam.
Return the result table ordered by student_id and subject_name.
*/
