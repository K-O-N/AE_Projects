with order_items as (
    select *
    from {{ ref('stg_ecomm__order_items') }}
),
products as (
    select *
    from {{ ref('stg_ecomm__products') }}
)
select 
    user_id,
    min(created_at) as first_seen,
    max(created_at) as last_seen,
    count(order_id) as orders_till_date,
    ROUND(sum(sale_price), 4) as total_revenue,

from order_items oi
left join products p
    on oi.product_id = p.product_id
where order_status = 'Complete'
group by user_id 