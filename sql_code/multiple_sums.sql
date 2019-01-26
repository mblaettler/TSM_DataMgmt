-- Calculate sum over each month,
-- do a commulative sum for each year,
-- and one and overall
SELECT s_year, s_month, sales AS monthly_sales, SUM(sales) OVER (
  ORDER BY s_year, s_month) AS cum_monthly_sales_total,
  SUM(sales) OVER (
    PARTITION BY s_year
    ORDER BY s_year, s_month) AS cum_monthly_sales_per_year
FROM AP_SALES
ORDER BY s_year, s_month;