with order_agg as (

    select *
    from {{ ref('int_orders_aggregated') }}
),
order_details as (

    select * from {{ ref('int_order_Items_enriched') }}
)

select oa.order_id, 
       oa.user_id, 
       oa.created_at,
       order_count,
       order_revenue,
       order_margin,
       order_status,
       shipped_at,
       delivered_at,
       returned_at,
       sale_price
       
from order_agg oa inner join order_details od on oa.order_id = od.id

    

