SELECT
  CAST(user_id AS STRING) AS distinct_id,
  event_type AS event_name,
  created_at AS timestamp,
  -- Creating a JSON- like property stirng for Mixpanel compatibility
  FORMAT('{"browswer":"%s","traffic_source":"%s"}',browser,traffic_source),
  ip_address,
  city,
  state  
FROM `bigquery-public-data.thelook_ecommerce.events`
WHERE created_at >= '2024-01-01'
  AND user_id IS NOT NULL
LIMIT 100;