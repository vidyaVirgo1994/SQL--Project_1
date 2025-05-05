-- SQL Retail Sales Analysis -P1
--Create Table

CREATE TABLE retail_sales
        (
           transactions_id INT PRIMARY KEY,
		   sale_date	    DATE,
		   sale_time	    TIME ,
		   customer_id      INT,
		   gender	       VARCHAR(15),
		   age   INT,
		   category         VARCHAR(15),
		   quantiy	          INT,
		   price_per_unit	FLOAT,
		   cogs	            FLOAT,
		   total_sale       FLOAT
	      );

		  
SELECT * FROM retail_sales	
LIMIT 10

SELECT 
COUNT (*) 
FROM retail_sales

--
SELECT * FROM retail_sales
WHERE transactions_id IS NULL

SELECT * FROM retail_sales
WHERE sale_date IS NULL

SELECT * FROM retail_sales
WHERE 
     transactions_id IS NULL
	 OR
	 sale_date IS NULL
	 OR
	 sale_time IS NULL
	 OR 
	 gender IS NULL
	 OR 
	 category IS NULL
	 OR
	 quantiy IS NULL
	 OR
	 cogs IS NULL
	 OR
	 total_sale IS NULL;

--Data cleaning

DELETE FROM retail_sales
WHERE 
     transactions_id IS NULL
	 OR
	 sale_date IS NULL
	 OR
	 sale_time IS NULL
	 OR 
	 gender IS NULL
	 OR 
	 category IS NULL
	 OR
	 quantiy IS NULL
	 OR
	 cogs IS NULL
	 OR
	 total_sale IS NULL;

--Data Exploration 

--How many sales we have?
SELECT COUNT (*) as total_sale FROM retail_sales

--How many customers we have?
SELECT COUNT (customer_id) as total_sale FROM retail_sales

--How many unique customers we have?
SELECT COUNT (DISTINCT customer_id) as total_sale FROM retail_sales

--How many unique category we have?
SELECT COUNT (DISTINCT category) as total_sale FROM retail_sales

--What are distinct category we have?
SELECT DISTINCT category FROM retail_sales

--Data Analysis & Business key problems & Answers

--My Analysis & Findings

--Q.1 write a SQL query to retrieve all columns for sales made on '2022-11-05'

SELECT * 
FROM retail_sales
WHERE sale_date ='2022-11-05';

--Q.2 write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022

SELECT *
FROM retail_sales
WHERE 
   category = 'Clothing'
AND
   TO_CHAR(sale_date,'yyyy-mm') = '2022-11'
AND
   quantiy>=4

--Q.3 write a SQL query to calculate the total sales (total_sale)for each category.

SELECT 
    category,
	SUM(total_sale) as net_sale,
	COUNT(*) as total_orders
FROM retail_sales
GROUP BY 1

--Q.4 write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.

SELECT
 ROUND(AVG(age),2) as avg_age
FROM retail_sales
WHERE category = 'Beauty'

--Q.5 write a SQL query to find all transactions where the total_sale is greater than 1000.

SELECT *
FROM retail_sales
WHERE total_sale > 1000

--Q.6 write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.

SELECT 
    category,
	gender,
	count(*) as total_trans
FROM retail_sales
GROUP BY category,
          gender
ORDER BY 1

--Q.7 Write a SQL query to find the top 5 customers based on the highest total sales

SELECT
   customer_id,
   SUM(total_sale) as total_sales
FROM retail_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5


