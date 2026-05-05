SELECT
  p.distribution_center_id,
  dc.name AS seller_warehouse_name,
  COUNT(p.id) AS total_items_listed,
  ROUND(AVG(p.retail_price),2) AS avg_listing_price,
  ROUND(SUM(p.retail_price),2) AS total_inventory_value
FROM `bigquery-public-data.thelook_ecommerce.products` AS p
INNER JOIN `bigquery-public-data.thelook_ecommerce.distribution_centers` AS dc
  ON p.distribution_center_id = dc.id
GROUP BY
  p.distribution_center_id,
  dc.name
HAVING total_items_listed > 500
ORDER BY
  total_inventory_value DESC;