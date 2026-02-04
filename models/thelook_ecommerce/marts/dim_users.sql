with stg_users as (

    select *
    from {{ ref('stg_ecomm__users') }}

),
user_history as (

    select *
    from {{ ref('int_users_purchase') }}
)
select
    su.user_id,
    first_name,
    last_name,
    email,
    age,
    gender,
    state,
    city,
    country,
    traffic_source,
    first_seen,
    last_seen,
    orders_till_date,
    total_revenue
    

from stg_users su 
left join user_history  uh on su.user_id=uh.user_id
