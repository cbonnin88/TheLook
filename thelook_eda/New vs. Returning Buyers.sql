SELECT 
  order_id,
  user_id,
  created_at,
  CASE
    WHEN created_at = (
      SELECT
        MIN(created_at)
      FROM `bigquery-public-data.thelook_ecommerce.orders` AS o2
      WHERE o2.user_id = o1.user_id
    )
    THEN 'New'
    ELSE 'Returning'
  END AS user_type
FROM `bigquery-public-data.thelook_ecommerce.orders` AS o1