SELECT s_year, s_month, sales AS monthly_sales, RANK() OVER (
  PARTITION BY s_year
  ORDER BY sales DESC) AS rank_monthly_sales_per_year
FROM AP_SALES
ORDER BY s_year, rank_monthly_sales_per_year;