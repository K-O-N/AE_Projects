with products as (

    select *
    from {{ ref('stg_ecomm__products') }}

)

select
    product_id,
    product_name,
    brand,
    category,
    department,
    sku,
    cost,
    retail_price
from products
