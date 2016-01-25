SELECT s_year, s_month, sales AS monthly_sales, ROUND(AVG(sales) OVER (
  ORDER BY s_year, s_month
  ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING)) AS avg_prev_3_months,
  TO_CHAR(ROUND((sales - ROUND(AVG(sales) OVER (
    ORDER BY s_year, s_month
    ROWS BETWEEN 3 PRECEDING AND 1 PRECEDING),0))/sales*100,2),'9999.9')||'%' AS difference_percent
FROM AP_SALES
ORDER BY s_year, s_month;