SELECT
  FORMAT_DATE('%Y-%m',created_at) AS month,
  COUNT(DISTINCT order_id) AS total_orders,
  ROUND(SUM(sale_price),2) AS gross_merchandise_value
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY 
  1
ORDER BY
  1 DESC;