SELECT TOP (1000) [id]
      ,[first_name]
      ,[country]
      ,[score]
  FROM [MyDatabase].[dbo].[customers]

USE MyDatabase;
GO
  SELECT *
  FROM customers;
-- DATA QUERY LANGUAGE 
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
country,
SUM (score)
FROM customers
GROUP BY country;

--Write a query to find the total number of customers in each country

SELECT 
country,
SUM(id) as total_customers
from customers
group by country;

--Calculate the average score for each country

SELECT 
country,
AVG(SCORE)
FROM customers
GROUP BY country;

--Find the highest (maximum) score in each country

SELECT 
country,
MAX(SCORE)
FROM customers
GROUP BY country;

--Calculate the total sum of score points for each country

SELECT 
country,
SUM (score)
FROM customers
GROUP BY country;

--Count how many customers have a score strictly greater than 0 in each country

SELECT 
    
    country, 
    COUNT (ID) AS ACTIVE_CUSTOMERS
FROM customers
WHERE score >0
GROUP BY country;

--Calculate the average score for customers in each country, but only include customers with a score of at least 400.

SELECT 
    country,
    AVG (SCORE) AS AVG_SCORE

FROM customers
WHERE score >= 400
GROUP BY country;

-- List each country along with its total customer count, ordered by the customer count from highest to lowest.

SELECT 
country,
COUNT(ID)

FROM customers
GROUP BY country
ORDER BY COUNT(ID) DESC;


--Find the average score for each country, sorted alphabetically by country name.

SELECT 
    country,
    AVG (SCORE)


FROM customers
GROUP BY country
ORDER BY country ASC

-- HAVING CLAUSE
/* FIND THE AVERAGE SCORE OF EACH COUNTRY CONSIDERING ONLY CUSTOMERS WITH A SCORE NOT EQUAL TO 0 AND 
RETURN ONLY THOSE COUNTRIES WITH AN AVERAGE OF SCORE OF GREATER THAN 430 */

SELECT 
    country,
    AVG (score)

FROM customers
WHERE score ! = 0
GROUP BY  country
HAVING AVG (SCORE) >430;

--Write a query to find countries that have strictly more than 1 customer.

SELECT 
    country,
    COUNT (id)
FROM customers
--WHERE COUNT (id) >1; - this code is wrong bcz either we can find the count or group the country so having clause will be apply
group by country
having COUNT (id) >1;

--Find all countries where the average score is strictly greater than 500.

SELECT 
    country,
    AVG (score)
FROM customers
group by country
having AVG (score) >500;

--Retrieve countries where the total sum of scores is at least 800.

SELECT 
    country,
    SUM (SCORE)

FROM customers
GROUP BY country
HAVING SUM (SCORE) > 800;

--Find countries where even the lowest score (MIN) is greater than 100.
SELECT 
    country,
    MIN (SCORE)

FROM customers
GROUP BY country
HAVING MIN (SCORE) >100;

/* Exclude customers with a score of 0 first (WHERE). 
Then, group by country and return only those countries with an average score greater than 450 (HAVING).
*/

SELECT 
    country,
    AVG (score)

FROM customers
WHERE score > 0
GROUP BY country
HAVING AVG (score) >450;

--Exclude customers from the UK. Then, group by country and find countries with a total score greater than 800

SELECT 
    country,
    SUM (score)

FROM customers
WHERE country !='UK'
GROUP BY country
HAVING SUM (score)>800;


--Find countries with more than 1 customer. Display the country and its average score, sorted by the average score from highest to lowest.

SELECT 
    country,
    AVG (score) as avg_score
FROM customers
group by country
having COUNT (country) > 1
order by avg(score)desc;


-- Find countries where the maximum score is 750 or higher, ordered alphabetically by country name.

SELECT 
    country,
    score

FROM customers
where score >= 750
order by country asc;

--DISTINCT CLAUSE

-- unique list of all country

SELECT distinct 
    country
    
FROM customers;

--top clause

-- retrieve only 3 country

SELECT TOP 3 *
    
FROM customers;
 
-- RETRIEVE THE TOP 3 CUSTOMERS WITH THE HIGHEST SCORE

SELECT TOP 3 
    first_name,
    score
    
FROM customers
order by score desc

--PRACTICE QUESTION BY COMBINING ALL CLAUSES

--Write a query to return a list of all unique countries in the table, sorted alphabetically.

SELECT DISTINCT TOP 3
    country

FROM customers
ORDER BY country ASC

--Retrieve the top 2 highest-scoring customers in the entire table.

SELECT TOP 2 
    first_name,
    score 
FROM customers
order by score desc

--Retrieve the top 2 unique scores from the table, ordered from highest to lowest

SELECT DISTINCT TOP 2
    score
FROM customers
ORDER BY score desc

--Find all unique countries of customers who have a score greater than 400, ordered in reverse alphabetical order (Z to A)

SELECT DISTINCT 
    country,
    score

FROM customers
WHERE score >400
ORDER BY country DESC;

--Retrieve the top 2 customers who are not from the USA, sorted by their score in descending order.

SELECT TOP 2
    score

FROM customers
WHERE country ! = 'USA'
ORDER BY score desc;


/* Exclude customers with a score of 0 first (WHERE).Then, calculate the average score for each country (GROUP BY).
Keep only countries where the average score is 500 or higher (HAVING). 
Sort the results by average score from highest to lowest (ORDER BY) and display only the top 1 country (TOP / LIMIT)

*/

SELECT TOP 1
    
    AVG (score) as AVG_SCORE

FROM customers
WHERE score > 0
group by country
HAVING AVG(score) >= 500
ORDER BY AVG_SCORE desc

/* Find the total sum of scores for each country, considering only customers with a score of at least 350. 
Keep only countries whose combined score exceeds 800.
Display the top 2 countries ordered by their total score in descending order.
*/

SELECT top 2
    country,
    SUM(score)
    

FROM customers
WHERE score >= 350
group by country
having SUM(score) > 800
order by country desc

/*Count how many distinct customer names exist per country for customers with a score greater than 100
Display only countries with more than 1 such customer, sorted by country name alphabetically, limited to 1 result.
*/

--DATA DEFINATION LANGUAGE - CREATE,ALTER,DROP CREATE TABLE (COLUMN_NAME, DATATYPE, CONSTRANT)


-- CREATE A NEW TABLE CALLED PERSONS WITH COLUMNS: ID,PERSON_NAME,BIRTH_DATE,PHONE 
CREATE TABLE PERSONS (
    ID INT NOT NULL,
    PERSON_NAME VARCHAR(50) NOT NULL,
    BIRTH_DATE DATE,
    PHONE_NUMBER VARCHAR(15) NOT NULL,
    CONSTRAINT PK_PERSONS PRIMARY KEY (ID)  --THIS IS STANDRAD FORMAT TO MAINTAINT ANY PRIMARY,FOREIGN KEY AT LAST AFTER DEFINE SCHEMA
)

-- FOR CHANGE IN TABLE 

ALTER TABLE PERSONS
ADD EMAIL_ID VARCHAR(50) NOT NULL

-- FOR DROP COLUMN
ALTER TABLE PERSONS
DROP COLUMN PHONE_NUMBER

-- FOR DROP TABLE

DROP TABLE PERSONS

-- DML Language 

-- insert column

SELECT *

FROM customers

INSERT INTO customers (id,first_name,country,score)
values (6,'Anna','USA',NULL),(7,'Sam',NULL,100),(8,'USA','Max',NULL),(9,'Andreas','Germany',NULL);

INSERT INTO customers(id,first_name)
values (10,'Sahra')

-- step to insert data from source table (customers) to target table (persons)

insert into PERSONS (ID,PERSON_NAME,BIRTH_DATE,PHONE_NUMBER)
SELECT 
    id,
    first_name,
    null,
    'unknown'
from customers;

SELECT *
FROM PERSONS;

--CHANGE THE SCORE OF CUSTOMERS 10 TO 0 AND UPDATE THE COUNTRY TO UK
UPDATE customers
SET score = 10,
    country = 'UK'
WHERE id = 10;

UPDATE customers
SET score = 0
    
WHERE id = 10;



SELECT *
FROM customers;

--UPDATE ALL CUSTOMERS WITH A NULL SCORE BY SETTINGS THEIR SCORE TO 0

UPDATE customers
    SET score = 0
    WHERE score IS NULL


SELECT *
FROM customers
WHERE score IS NULL

--UPDATE ALL DATA IN CUSTOMERS TABLE ID > 5

DELETE FROM customers
WHERE id > 5;

SELECT *
FROM customers
WHERE id > 5;

-- TRUNCATE (FAST DELETE ALL DATA) / DELETE(FULL DATA BUT TAKE MORE TIME)
-- DELETE DATA OF PERSONS TABLE

TRUNCATE TABLE PERSONS;


SELECT *
FROM PERSONS;
