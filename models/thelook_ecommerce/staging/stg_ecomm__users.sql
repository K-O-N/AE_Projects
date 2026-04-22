with user_stg as (

    select * 
    -- from bigquery-public-data.thelook_ecommerce.users
    from {{ source('ecomm', 'users') }}

)
select id as user_id,
       first_name,
       last_name,
       email,
       age,
       gender,
       state,
       street_address,
        postal_code,
        city,
        country,
        latitude,
        longitude,
        traffic_source,
        cast(created_at as timestamp) as created_at
from user_stg