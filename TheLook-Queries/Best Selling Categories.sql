SELECT
  p.category,
  COUNT(oi.order_id) AS total_orders,
  ROUND(SUM(oi.sale_price),2) AS total_revenue
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN `bigquery-public-data.thelook_ecommerce.products`AS p
  ON oi.product_id = p.id
WHERE
  oi.status = 'Complete'
GROUP BY  
  1
ORDER BY
  total_revenue DESC;