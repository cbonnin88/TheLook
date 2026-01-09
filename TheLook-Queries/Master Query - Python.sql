SELECT
  e.user_id,
  e.session_id,
  e.created_at AS event_timestamp,
  e.event_type,
  e.traffic_source,
  e.browser,
  u.country,
  u.gender,
  p.category AS product_category,
  p.retail_price
FROM `bigquery-public-data.thelook_ecommerce.events` AS e
LEFT JOIN `bigquery-public-data.thelook_ecommerce.users` AS u
  ON e.user_id = u.id
LEFT JOIN `bigquery-public-data.thelook_ecommerce.inventory_items` AS ii
  ON
    -- Optimize the LIKE join by extracting product_id from URI
    -- and joining on the extracted ID.
    -- Use SAFE_CAST in case REGEXP_EXTRACT does not find a match or the value is not a valid integer.
    SAFE_CAST(REGEXP_EXTRACT(e.uri, r'/product/(\d+)') AS INT64) = ii.product_id
LEFT JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
  ON ii.product_id = p.id
WHERE
  e.created_at >= TIMESTAMP_SUB(CURRENT_TIMESTAMP(), INTERVAL 90 DAY)
  AND e.event_type IN ('product', 'cart', 'purchase', 'cancel')
  AND e.user_id IS NOT NULL
ORDER BY e.user_id, e.created_at;
