SELECT
  category,
  ROUND(MIN(retail_price),2) AS min_price,
  ROUND(AVG(retail_price),2) AS avg_price,
  ROUND(MAX(retail_price),2) AS max_price  
FROM `bigquery-public-data.thelook_ecommerce.products`
GROUP BY
  category;