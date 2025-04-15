# Sales Trend Analysis Using SQL

This project focuses on analyzing online sales data to extract monthly trends and valuable business insights using SQL (MySQL Workbench).

## *Objective*

Analyze monthly revenue and order volume from a cleaned online sales dataset using SQL aggregations. Gain practical skills in data grouping, filtering, and aggregation.

## *Tools Used*

- MySQL Workbench
- Excel (for cleaned data and exporting results)
- CSV files (cleaned and outputs)
- PowerPoint (for presentation - optional)

## *Dataset*

- cleaned_online_sales.csv
- Fields: transaction_id, order_date, amount, product_id, customer_id, region, payment_method, product_category

## *Key SQL Tasks Performed*

1. *Create Database and Table*
2. *Import Cleaned Data*
3. *Monthly Revenue & Order Volume*
4. *Top 5 Products by Revenue*
5. *Region-Wise Sales*
6. *Product Category Monthly Trend*
7. *Peak Revenue Day*
8. *Payment Method Preferences*

## *SQL Queries Highlights*

```sql
-- Monthly Revenue and Order Volume
SELECT 
  YEAR(order_date) AS year,
  MONTH(order_date) AS month,
  COUNT(DISTINCT transaction_id) AS total_orders,
  SUM(amount) AS total_revenue
FROM cleaned_online_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY year, month;

## *Outcome / Learnings*

Practical experience in using SQL for business insights

Ability to group data by time (year/month)

Use of SQL functions: SUM(), COUNT(), GROUP BY, ORDER BY, EXTRACT()

Exporting result sets for reporting.
