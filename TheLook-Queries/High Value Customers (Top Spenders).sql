SELECT
  user_id,
  COUNT(order_id) AS order_count,
  ROUND(SUM(sale_price),2) AS lifetime_value
FROM `bigquery-public-data.thelook_ecommerce.order_items`
GROUP BY
  1
HAVING COUNT(order_id) > 5
ORDER BY
  3 DESC
LIMIT 10;