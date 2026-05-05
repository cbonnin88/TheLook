SELECT
  oi.order_id,
  p.name AS product_name,
  COALESCE(p.category,'Uncategorized/Misc') AS cleaned_category,
  ROUND(oi.sale_price,2) AS sale_price,
  oi.status
FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON oi.product_id = p.id
WHERE oi.created_at >= '2024-01-01';