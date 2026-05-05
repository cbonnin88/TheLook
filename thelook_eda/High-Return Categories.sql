SELECT
  p.category,
  COUNT(CASE WHEN oi.status = 'Complete' THEN 1 END) AS sold_count,
  COUNT(CASE WHEN oi.status = 'Returned' THEN 1 END) AS returned_count,
  SAFE_DIVIDE(COUNT(CASE WHEN oi.status = 'Returned' THEN 1 END), COUNT(oi.id)) AS return_rate
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
FULL OUTER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p 
  ON oi.product_id = p.id
GROUP BY
  p.category
ORDER BY
  return_rate DESC;