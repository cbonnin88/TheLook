SELECT
  user_id,
  event_type AS current_event,
  -- Looking ahead 1 row to see the NEXT event for this user
  LEAD(event_type) OVER(PARTITION BY user_id ORDER BY created_at) AS next_event,
  created_at
FROM `bigquery-public-data.thelook_ecommerce.events`
WHERE
  created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 30 DAY)
  AND user_id IS NOT NULL
LIMIT 100;