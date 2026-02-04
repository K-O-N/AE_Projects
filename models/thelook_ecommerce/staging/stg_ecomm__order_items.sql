with order_stg as (

    select * 
    -- from bigquery-public-data.thelook_ecommerce.order_items
    from {{ source('ecomm', 'order_items') }}

)
select id,
       order_id,
       user_id,
       product_id,
       inventory_item_id,
       status as order_status,
       created_at,
       shipped_at,
       delivered_at,
       returned_at,
       sale_price

from order_stg