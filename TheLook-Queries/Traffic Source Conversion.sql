SELECT
  traffic_source,
  COUNT(DISTINCT user_id) AS total_users,
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) AS purchasers,
  -- Calculate raw conversion rate
  COUNT(DISTINCT CASE WHEN event_type = 'purchase' THEN user_id END) / COUNT(DISTINCT user_id) AS raw_conv_rate
FROM `bigquery-public-data.thelook_ecommerce.events`
GROUP BY
  1
ORDER BY
  raw_conv_rate DESC;