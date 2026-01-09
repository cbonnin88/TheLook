SELECT
  country,
  COUNT(id) AS total_users
FROM `bigquery-public-data.thelook_ecommerce.users`
GROUP BY
  country
ORDER BY
  total_users DESC
LIMIT 10;