select *
from {{ ref('int_orders_aggregated') }}
where order_revenue < 0
