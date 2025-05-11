
--preview columns
SELECT * FROM sales_data_sample sds 
LIMIT 5;

--find top customers and their countries
SELECT 
	"CUSTOMERNAME" , 
	"COUNTRY",
	SUM("SALES" )
FROM sales_data_sample sds 
GROUP BY 1 , 2
ORDER BY 3 DESC
LIMIT 5; 

--finding customer with large orders
SELECT 
	"CUSTOMERNAME", 
	COUNT(DISTINCT "ORDERNUMBER")
FROM sales_data_sample sds 
GROUP BY 1
HAVING AVG("QUANTITYORDERED") > 40
ORDER BY 2 DESC;

-- orders by dealsize
SELECT 
	"DEALSIZE",
	COUNT(DISTINCT "ORDERNUMBER") as "QTYOFORDERS"
FROM sales_data_sample sds 
GROUP BY 1


-- find sales overall
SELECT
	"COUNTRY", 
	COUNT(DISTINCT "ORDERNUMBER") as ORDERCOUNT,
	SUM("QUANTITYORDERED") as TOTALQTYORDERED
FROM sales_data_sample sds 
GROUP BY 1 
ORDER BY 2 DESC; 


-- find sales by state in USA 
SELECT
	"STATE", 
	COUNT(DISTINCT "ORDERNUMBER")
FROM sales_data_sample sds 
WHERE "COUNTRY"= 'USA'
GROUP BY 1 
ORDER BY 2 DESC;

--find sales by country in Europe
SELECT 
	"COUNTRY", 
	COUNT(DISTINCT "ORDERNUMBER")
FROM sales_data_sample sds 
WHERE "COUNTRY" IN  ('Australia', 'Austria', 'Belgium', 'Denmark', 'Finland', 'France', 'Germany', 'Ireland', 'Italy', 
'Norway', 'Spain', 'Sweden', 'Switzerland', 'UK')
GROUP BY 1
ORDER BY 2 DESC;

-- find sales price each, average sales amount, and count of orders over time
SELECT
	"YEAR_ID", 
	"MONTH_ID", 
	ROUND(AVG("PRICEEACH")::numeric, 2) as "AVGPRICEEACH", 
	ROUND(AVG("SALES")::numeric, 0) as "AVGSALESAMT", 
	COUNT(DISTINCT "ORDERNUMBER") as "COUNTOFORDERS"
FROM sales_data_sample sds 
GROUP BY 1, 2
ORDER BY 1, 2; 


	