SELECT s_year, s_month, ROUND(AVG(sales)) AS avg_monthly_sales
FROM AP_SALES
GROUP BY GROUPING SETS (s_year, s_month, (s_year, s_month))
ORDER BY s_year, s_month;