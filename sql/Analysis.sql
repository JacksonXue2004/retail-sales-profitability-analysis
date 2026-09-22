USE retail_sales;

SELECT COUNT(*) AS row_count
FROM sales_transactions;

SELECT
	COUNT(DISTINCT Transaction_ID) as transaction,
	COUNT(DISTINCT Order_ID) as orders,
	COUNT(DISTINCT Customer_ID) as customers
from sales_transactions;

SELECT
    ROUND(SUM(Sales_Amount), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM sales_transactions;

#SQL Analysis 1：Annual Sales and Profit Trends
# How did sales, profit, and order volume change from 2022 to 2025?

select 
		Year(Order_Date) as Year,
		sum(Sales_Amount) as Sales,
		sum(Profit) as Profit,
		count(DISTINCT Order_ID) as Orders
from sales_transactions
group by Year(Order_Date)
ORDER BY Year(Order_Date);

#Business Question #2
#Which product categories generate the most sales and profit, and how do their profit margins compare?

SELECT
	Product_Category as Category,
	sum(Sales_Amount) as Sales,
	sum(Profit) as Profit,
	count(DISTINCT Order_ID) as Orders,
	(sum(Profit) / sum(Sales_Amount)) * 100 as Profit_Margin
FROM sales_transactions
GROUP BY Product_Category
ORDER BY sum(Sales_Amount) DESC;

#Business Question #3

#Which product subcategories contribute the most revenue, and which have relatively high or low profit margins?

SELECT
	Product_Subcategory as Subcategory,
	sum(Sales_Amount) as Sales,
	sum(Profit) as Profit,
	count(DISTINCT Order_ID) as Orders,
	(sum(Profit) / sum(Sales_Amount)) * 100 as Profit_Margin
FROM sales_transactions
GROUP BY Product_Subcategory
ORDER BY sum(Sales_Amount) DESC;

#4
#Does discount level have a relationship with profitability?

SELECT
	CASE
		WHEN Discount_Percentage = 0 THEN "0%"
		WHEN Discount_Percentage <= 5 THEN "1%-5%"
		WHEN Discount_Percentage <= 10 THEN "6%-10%"
		WHEN Discount_Percentage <= 15 THEN "11%-15%"
		WHEN Discount_Percentage <= 20 THEN "16%-20%"
		ELSE "20%+"
	END AS Discount_Band,
	sum(Sales_Amount) as Sales,
	sum(Profit) as Profit,
	count(DISTINCT Order_ID) as Orders,
	(sum(Profit) / sum(Sales_Amount)) * 100 as Profit_Margin
FROM sales_transactions
GROUP BY
	CASE
		WHEN Discount_Percentage = 0 THEN "0%"
		WHEN Discount_Percentage <= 5 THEN "1%-5%"
		WHEN Discount_Percentage <= 10 THEN "6%-10%"
		WHEN Discount_Percentage <= 15 THEN "11%-15%"
		WHEN Discount_Percentage <= 20 THEN "16%-20%"
		ELSE "20%+"
	END;

#5
#How do different customer segments compare in sales, orders, customers, and profitability?

SELECT
	Customer_Segment,
	sum(Sales_Amount) as Sales,
	sum(Profit) as Profit,
	count(DISTINCT Order_ID) as Orders,
	count(DISTINCT Customer_ID) as Customers,
	(sum(Profit) / sum(Sales_Amount)) * 100 as Profit_Margin
FROM sales_transactions
GROUP BY Customer_Segment
ORDER BY sum(Sales_Amount) DESC;

#6
#How much sales and how many orders does each customer generate on average within each segment?

SELECT
	Customer_Segment,
	sum(Sales_Amount) as Sales,
	sum(Profit) as Profit,
	count(DISTINCT Order_ID) as Orders,
	count(DISTINCT Customer_ID) as Customers,
	(sum(Profit) / sum(Sales_Amount)) * 100 as Profit_Margin,
	sum(Sales_Amount) / count(DISTINCT Customer_ID) as Sales_Per_Customer,
	count(DISTINCT Order_ID) / count(DISTINCT Customer_ID) as Orders_Per_Customer
FROM sales_transactions
GROUP BY Customer_Segment
ORDER BY sum(Sales_Amount) DESC;

#7
#How do sales channels differ in sales, orders, customers, AOV, and profit margin?

SELECT
	Sales_Channel,
	sum(Sales_Amount) as Sales,
	sum(Profit) as Profit,
	count(DISTINCT Order_ID) as Orders,
	count(DISTINCT Customer_ID) as Customers,
	(sum(Profit) / sum(Sales_Amount)) * 100 as Profit_Margin,
	sum(Sales_Amount) / count(DISTINCT Order_ID) as AOV
FROM sales_transactions
GROUP BY Sales_Channel
ORDER BY SUM(Sales_Amount) DESC;

#8
#Why is B2B Portal AOV substantially higher than other channels?


SELECT
	Sales_Channel,
	count(DISTINCT Order_ID) as Orders,
	SUM(Quantity) / COUNT(DISTINCT Order_ID) as Average_Quantity_per_Order,
	AVG(Unit_Price) as Average_Unit_Price,
	AVG(Discount_Percentage) as Average_Discount,
	sum(Sales_Amount) / count(DISTINCT Order_ID) as AOV
FROM sales_transactions
GROUP BY Sales_Channel
ORDER BY Orders DESC;

#9 Are there obvious differences in sales performance between different countries?

SELECT
	Country,
	sum(Sales_Amount) as Sales,
	sum(Profit) as Profit,
	count(DISTINCT Order_ID) as Orders,
	count(DISTINCT Customer_ID) as Customers,
	sum(Sales_Amount) / (SELECT sum(Sales_Amount) total_sales from sales_transactions) * 100 as Sales_Share,
	(sum(Profit) / sum(Sales_Amount)) * 100 as Profit_Margin,
	sum(Sales_Amount) / count(DISTINCT Order_ID) as AOV

FROM sales_transactions
GROUP BY Country
ORDER BY Sales DESC;

#better method

WITH country_sales as (
	SELECT
		Country,
		sum(Sales_Amount) as Sales,
		sum(Profit) as Profit,
		count(DISTINCT Order_ID) as Orders,
		count(DISTINCT Customer_ID) as Customers
	FROM sales_transactions
	GROUP BY Country
)

SELECT
	Country,
	Sales,
	Profit,
	Orders,
	Customers,
	Sales / sum(Sales) over() * 100 as Sales_Share,
	Profit / Sales * 100 as Profit_Margin,
	Sales / Orders as AOV
FROM country_sales
ORDER BY Sales DESC;

