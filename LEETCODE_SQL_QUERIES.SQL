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