

SELECT id as user_id,
       display_name,
       about_me as user_info,
       age,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', creation_date) as creation_date,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', last_access_date) as last_access_date,
       location,
       reputation,
       up_votes,
       down_votes,
       views
       
FROM {{ source('stackoverflow', 'users') }} 