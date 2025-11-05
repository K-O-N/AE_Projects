select id as user_id,
       display_name,
       creation_date,
       location,
       reputation,
       up_votes,
       down_votes,
       views
from {{ ref('stg_users') }}