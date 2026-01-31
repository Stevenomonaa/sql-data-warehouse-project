/*
===============================================================================
Change Over Time Analysis 
===============================================================================
Purpose:
    - To track trends, growth, and changes in key metrics over time.
    - For time-series analysis and identifying seasonality.
    - To measure growth or decline over specific periods.

SQL Functions Used:
    - Date/Time Functions: EXTRACT(), DATE_TRUNC(), TO_CHAR()
    - Aggregate Functions: SUM(), COUNT(), AVG()
===============================================================================
*/

--Sales performance over time


--Change over Time (Yearly)

SELECT
    EXTRACT(YEAR FROM order_date) AS years,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY 
    years
ORDER BY 
    years, total_sales;

--Change over Time (Monthly)
--January from every year is aggregated into one row.

SELECT
    EXTRACT(MONTH FROM order_date) AS months,
    SUM(sales_amount) AS total_sales,
    COUNT(DISTINCT customer_key) AS total_customers,
    SUM(quantity) AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY 
	EXTRACT(MONTH FROM order_date)
ORDER BY 
    months;

--Change over Time (Years Detailed by Months)
SELECT
    EXTRACT(YEAR  FROM order_date) AS years,
    EXTRACT(MONTH FROM order_date) AS months,
    SUM(sales_amount)              AS total_sales,
    COUNT(DISTINCT customer_key)   AS total_customers,
    SUM(quantity)                  AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY
    EXTRACT(YEAR  FROM order_date), 
    EXTRACT(MONTH FROM order_date)
ORDER BY
    years,
    months;

--Change over TIme (Year & Month in one column)
--Sortable, Filterable & Index-Friendly

SELECT
    DATE_TRUNC('month', order_date)::DATE AS year_month,
    SUM(sales_amount)                     AS total_sales,
    COUNT(DISTINCT customer_key)          AS total_customers,
    SUM(quantity)                         AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY DATE_TRUNC('month', order_date)::DATE
ORDER BY year_month;


--Change over Year & Month in one column
--Good for dashboards & reports
SELECT
    TO_CHAR(order_date, 'YYYY-mon')  AS year_month,
    SUM(sales_amount)               AS total_sales,
    COUNT(DISTINCT customer_key)    AS total_customers,
    SUM(quantity)                   AS total_quantity
FROM gold.fact_sales
WHERE order_date IS NOT NULL
GROUP BY year_month
ORDER BY year_month;
