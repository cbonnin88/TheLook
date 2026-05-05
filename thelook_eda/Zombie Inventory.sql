SELECT
  p.id AS product_id,
  p.name,
  p.category,
  oi.created_at AS listed_date,
  DATE_DIFF(CURRENT_DATE(), DATE(MIN(oi.created_at)), DAY) AS days_on_market
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
JOIN `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  ON p.id = oi.product_id
WHERE
  p.id NOT IN (
    SELECT product_id FROM `bigquery-public-data.thelook_ecommerce.order_items`
  )
GROUP BY p.id, p.name, p.category,oi.created_at
HAVING days_on_market > 90
ORDER BY days_on_market DESC;