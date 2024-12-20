A. KPI’s


--1. TOTAL REVENUE:

SELECT SUM(total_price) as Total_Revenue
FROM pizza_sales





--2.AVERAGE ORDER VALUE

SELECT SUM(total_price) / COUNT(DISTINCT(order_id)) as AVG_ORDER_VALUE
FROM pizza_sales






--3. TOTAL PIZZAS SOLD

SELECT SUM(quantity) as total_pizza_sold
FROM pizza_sales




--4. TOTAL ORDERS

SELECT COUNT(DISTINCT(order_id)) as total_order 
FROM pizza_sales




--5. AVERAGE PIZZAS PER ORDER

SELECT SUM(quantity) / COUNT(DISTINCT(order_id)) as avg_pizzas_per_order
FROM pizza_sales




B. DAILY TREND FOR TOTAL ORDERS

SELECT TO_CHAR( order_date , 'DAY' ) as day_name ,COUNT(DISTINCT(order_id)) as total_order
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC




C. MONTHLY TREND ORDERS

SELECT TO_CHAR(order_date , 'MONTH') as month_name , COUNT(DISTINCT(order_id)) as total_order
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC




D. % OF SALES BY PIZZA CATEGORY

WITH REVENUE_BY_CATEGORY AS (
	SELECT pizza_category , sum(total_price) as total_revenue
	FROM pizza_sales
	GROUP BY 1
	ORDER BY 2 DESC
)
,
TOTAL_REVENUE AS (
	SELECT SUM(total_price) as Total_Sales
	FROM pizza_sales
)

SELECT pizza_category , total_revenue , 
	   CONCAT(ROUND(CAST(total_revenue AS NUMERIC) / CAST(Total_Sales as NUMERIC) * 100,2),'%') as PCT
FROM REVENUE_BY_CATEGORY,
     TOTAL_REVENUE




E. % OF SALES BY PIZZA SIZE

WITH SALES_PER_SIZE AS (
	SELECT pizza_size , SUM(quantity) as total_sales
	FROM pizza_sales
	GROUP BY 1
	ORDER BY 2 DESC
)
,
TOTAL_REVENUE AS (
	SELECT SUM(quantity) as total_revenue
	FROM pizza_sales
)

SELECT pizza_size , total_sales , 
	   CONCAT(ROUND(CAST(total_sales as NUMERIC) / CAST(total_revenue as NUMERIC)* 100 , 2),'%') as PCT
FROM SALES_PER_SIZE,
     TOTAL_REVENUE




F. TOTAL PIZZA SOLD BY PIZZA CATEGORY

SELECT pizza_category , SUM(quantity) as TOTAL_PIZZA
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC




G. TOP 5 PIZZA BY REVENUE

SELECT pizza_name , SUM(total_price) as TOTAL_REVENUE
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5




H.BOTTOM 5 PIZZA BY REVENUE

SELECT pizza_name , SUM(total_price) as total_revenue
FROM pizza_sales
GROUP BY 1
ORDER BY 2 ASC
LIMIT 5




I. TOP 5 PIZZA BY QUANTITY

SELECT pizza_name , SUM(quantity) as total_quantity
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5




J. BOTTOM 5 PIZZA BY QUANTITY

SELECT pizza_name , SUM(quantity) as total_quantity
FROM pizza_sales 
GROUP BY 1
ORDER BY 2 ASC
LIMIT 5





K. TOP 5 PIZZA BY TOTAL ORDERS

SELECT pizza_name , COUNT(DISTINCT(order_id)) as total_order
FROM pizza_sales
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5




L. BOTTOM 5 PIZZA BY TOTAL ORDERS

SELECT pizza_name , COUNT(DISTINCT(order_id)) as total_order
FROM pizza_sales
GROUP BY 1
ORDER BY 2 ASC
LIMIT 5



