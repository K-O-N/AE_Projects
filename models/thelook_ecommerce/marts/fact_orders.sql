{{
    config(
        materialized='incremental',
        unique_key='order_id',
        incremental_strategy: 'append'
    )
}}

with order_agg as (

    select *
    from {{ ref('int_orders_aggregated') }}
),
order_details as (

    select * from {{ ref('int_order_Items_enriched') }}
),
final as (

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
    

)

select * from final

{% if is_incremental() %}
    -- this filter will only be applied on an incremental run
    where created_at >= (select dateadd('day', -3, max(created_at)) from {{ this }}) 
{% endif %}

order by created_at desc

    

