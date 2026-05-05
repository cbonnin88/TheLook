SELECT
  user_id,
  session_id,
  created_at,
  event_type,
  -- Get the next event in the sequence to see the transition
  LEAD(event_type) OVER(PARTITION BY session_id ORDER BY created_at) AS next_event,
  -- Calculate time spent between events
  TIMESTAMP_DIFF(LEAD(created_at) OVER(PARTITION BY session_id ORDER BY created_at),created_at, SECOND) AS seconds_to_next_action
FROM `bigquery-public-data.thelook_ecommerce.events`
ORDER BY
  user_id,
  created_at;