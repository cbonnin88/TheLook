SELECT 
  DATE(created_at) AS event_date,
  COUNT(*) AS total_events
FROM `bigquery-public-data.thelook_ecommerce.events`
WHERE created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
GROUP BY 
  1
ORDER BY
  1 DESC;