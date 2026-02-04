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
       FORMAT_DATETIME('%Y-%m-%d %H:%M:%S', DATETIME(TIMESTAMP(created_at))) as created_at,
       FORMAT_DATETIME('%Y-%m-%d %H:%M:%S', DATETIME(TIMESTAMP(shipped_at))) as shipped_at,
       FORMAT_DATETIME('%Y-%m-%d %H:%M:%S', DATETIME(TIMESTAMP(delivered_at))) as delivered_at,
       FORMAT_DATETIME('%Y-%m-%d %H:%M:%S', DATETIME(TIMESTAMP(returned_at))) as returned_at,
       ROUND(sale_price, 4) as sale_price

from order_stg