with order_items as (
    select *
    from {{ ref('stg_ecomm__order_items') }}
),
products as (
    select *
    from {{ ref('stg_ecomm__products') }}
)
select 
    order_id,
    user_id,
    min(created_at) as created_at,
    count(order_id) as order_count,
    ROUND(sum(sale_price), 4) as order_revenue,
    ROUND(sum(sale_price - cost), 4) as order_margin
from order_items oi
left join products p
    on oi.product_id = p.product_id
where order_status = 'Complete'
group by order_id, user_id 