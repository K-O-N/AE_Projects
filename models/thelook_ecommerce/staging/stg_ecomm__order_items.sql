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
       cast(created_at as TIMESTAMP) as created_at,
       cast(shipped_at as TIMESTAMP) as shipped_at,
       cast(delivered_at as TIMESTAMP) as delivered_at,
       cast(returned_at as TIMESTAMP) as returned_at,
       ROUND(sale_price, 4) as sale_price

from order_stg