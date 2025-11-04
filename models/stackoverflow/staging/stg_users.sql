

SELECT id as user_id,
       display_name,
       about_me as user_info,
       age,
       creation_date,
       last_access_date,
    --    CAST(creation_date AS TIMESTAMP WITH TIME ZONE) AS creation_date,
    --    CAST(last_access_date AS TIMESTAMP WITH TIME ZONE) AS last_access_date,
       location,
       reputation,
       up_votes,
       down_votes,
       views
       
FROM {{ source('stackoverflow', 'users') }} 