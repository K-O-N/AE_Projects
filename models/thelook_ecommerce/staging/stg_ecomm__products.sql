with product_stg as (

    select * 
    -- from bigquery-public-data.thelook_ecommerce.products
    from {{ source('ecomm', 'products') }}

)
select id as product_id,
       ROUND(cost, 4) as cost,
       category,
       name as product_name,
       brand,
       ROUND(retail_price, 4) as retail_price,
       department,
       sku,
       distribution_center_id
from product_stg