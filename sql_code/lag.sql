SELECT s_year, s_month, sales AS monthly_sales, LAG(sales,1) OVER (
    ORDER BY s_year, s_month) AS previous_month_sales
FROM AP_SALES
ORDER BY s_year, s_month;