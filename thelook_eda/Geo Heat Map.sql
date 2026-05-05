SELECT 
  u.country,
  u.city,
  COUNT(DISTINCT o.order_id) AS total_orders,
  SUM(o.num_of_item) AS items_purchased
FROM `bigquery-public-data.thelook_ecommerce.users` AS u
INNER JOIN `bigquery-public-data.thelook_ecommerce.orders` AS o
  ON u.id = o.user_id
GROUP BY
  u.country,
  u.city
ORDER BY
  total_orders DESC
LIMIT 100;