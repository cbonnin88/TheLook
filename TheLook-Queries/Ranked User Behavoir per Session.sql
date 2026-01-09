SELECT
  session_id,
  user_id,
  event_type,
  created_at,
  -- Assign a sequence number to events within each session
  ROW_NUMBER() OVER(PARTITION BY session_id ORDER BY created_at ASC) AS event_sequence_number
FROM `bigquery-public-data.thelook_ecommerce.events`
WHERE
  created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 7 DAY)
ORDER BY
  session_id,
  event_sequence_number;