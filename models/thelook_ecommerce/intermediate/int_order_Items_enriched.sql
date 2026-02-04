with order_items as (
    select * from {{ ref('stg_ecomm__order_items') }}
),
stg_users as (
    select * from {{ ref('stg_ecomm__users') }}
),
products as (
    select * from {{ ref('stg_ecomm__products') }}
)

select 
    oi.id,
    oi.order_id,
    oi.user_id,
    oi.product_id,
    oi.order_status,
    oi.created_at,
    oi.shipped_at,
    oi.delivered_at,
    oi.returned_at,
    oi.sale_price,

    su.country,
    su.traffic_source,

    sp.product_name,
    sp.category,
    sp.brand,
    sp.cost,
    sp.retail_price,
    (oi.sale_price - sp.cost) as gross_margin
from order_items oi 
left join stg_users su on oi.user_id = su.user_id 
left join products sp on oi.product_id=sp.product_id