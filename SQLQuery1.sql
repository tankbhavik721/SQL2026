SELECT TOP (1000) [id]
      ,[first_name]
      ,[country]
      ,[score]
  FROM [MyDatabase].[dbo].[customers]


  SELECT *
  FROM customers;

-- WHERE (FILTER CONDITIONS PRACTICE QUESTIONS)

--1	Maria	Germany	350
--2	 John	USA	900
--3	Georg	UK	750
--4	Martin	Germany	500
--5	Peter	USA	0

--Write a query to find all details of the customer whose id is 3

 SELECT *  
 FROM customers
 WHERE id = 3;

--Find all customers who have a score of 500 or more
 
  SELECT *
  FROM customers 
  WHERE score >= 500; 

--List all customers whose score is less than 500.

SELECT *
FROM customers
WHERE score <500;

--RETRIEVE CUSTOMERS WITH A SCORE NOT EQUAL TO 0

SELECT * 
FROM customers
WHERE score >0;

--RETRIEVE CUSTOMERS FROM GERMANY

SELECT *
FROM customers
WHERE country = 'GERMANY';

--RETRIEVE FIRST_NAME AND SCORE FROM GERMANY

SELECT 
first_name,
score, 
id
FROM customers
WHERE country = 'GERMANY';

--ORDER BY (SORTING PRACTICE QUESTIONS)

--Ascending Numerical: Write a query to list all customers ordered by their score from lowest to highest.

SELECT *
FROM customers
ORDER BY score ASC;

--Descending Numerical: Write a query to retrieve all customers ordered by their score from highest to lowest.

SELECT *
FROM customers
ORDER BY score DESC;

--Alphabetical Sorting: Retrieve all customers in alphabetical order (A to Z) by their first_name.

SELECT *
FROM customers
ORDER BY first_name;

--Reverse Alphabetical: Display all customers ordered by their country in reverse alphabetical order (Z to A)

SELECT *
FROM customers
ORDER BY country DESC;

--WHERE AND ORDER BY COMBINING 

--Find all customers from Germany and order them by score in descending order

SELECT *
FROM customers
WHERE country = 'GERMANY'
ORDER BY score DESC;

--Retrieve all customers with a score greater than 400, sorted by their first_name alphabetically.

SELECT *
FROM customers
WHERE score > 400
ORDER BY first_name ASC;

--Select all customers who are not from the USA, ordered by score from lowest to highest.   

SELECT *
FROM customers
WHERE country != 'USA'
ORDER BY score ASC;

--Find all customers with a score strictly greater than 400, sorted by score from highest to lowest

SELECT *
FROM customers
WHERE score > 400
ORDER BY SCORE DESC;

--Retrieve all customers from the USA, sorted alphabetically (A to Z) by their first_name.

SELECT *
FROM customers
WHERE country = 'USA'
ORDER BY first_name ASC;

--Find all customers from Germany who have a score under 600, sorted by their id in descending order.

SELECT *
FROM customers
WHERE country = 'GERMANY' AND score <600
ORDER BY id DESC;

--Select all customers who are either from the UK OR have a score equal to 0, ordered by score from lowest to highest.

SELECT * 
FROM customers 
WHERE country = 'UK' OR score = 0 
ORDER BY score ASC;

--Retrieve all customers located in Germany or USA. Order the results by country alphabetically (A to Z), and within each country, sort by score from highest to lowest.

SELECT * 
FROM customers 
WHERE country IN ('GERMANY','USA')
ORDER BY country ASC,SCORE DESC; 

--Find all customers with a score between 300 and 800, sorted by first_name in reverse alphabetical order (Z to A).

SELECT *
FROM customers
WHERE score BETWEEN 300 AND 800
ORDER BY first_name DESC;

--Select all customers who are not from Germany, ordered first by country (A to Z) and second by first_name (A to Z).





--Select all customers who are not from Germany, ordered first by country (A to Z) and second by first_name (A to Z).

SELECT *
FROM customers
WHERE country != 'GERMANY'
ORDER BY country, first_name ASC;

/* GROUP BY CLAUSE
AGGREGATION FUNCTION - COUNT(),SUM(),AVG(),MIN(),MAX()
*/

-- Find the total score of each country

SELECT 
country
SUM (COUNTRY)
FROM customers
GROUP BY score;





























































