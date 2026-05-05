WITH brand_sales AS (
  
  SELECT
    brand,
    ROUND(SUM(sale_price),2) AS total_revenue
  FROM `bigquery-public-data.thelook_ecommerce.order_items` AS oi
  INNER JOIN `bigquery-public-data.thelook_ecommerce.products` AS p
    ON oi.product_id = p.id
  WHERE oi.status = 'Complete'
  GROUP BY
    brand
)
SELECT
  brand_sales.brand,
  brand_sales.total_revenue,
  ROUND(100* brand_sales.total_revenue / SUM(brand_sales.total_revenue)OVER(),2) AS market_shart_percent
FROM brand_sales
ORDER BY
  total_revenue DESC
LIMIT 10;