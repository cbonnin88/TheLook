WITH OrderData AS (
  SELECT
    user_id,
    created_at AS order_date,
    -- Get the date of the PREVIOUS order
    LAG(created_at) OVER(PARTITION BY user_id ORDER BY created_at) AS previous_order_date
  FROM `bigquery-public-data.thelook_ecommerce.orders`
)
SELECT
  user_id,
  order_date,
  previous_order_date,
  TIMESTAMP_DIFF(order_date,previous_order_date, DAY) AS days_since_last_order
FROM OrderData
WHERE previous_order_date IS NOT NULL
ORDER BY days_since_last_order DESC
LIMIT 100;