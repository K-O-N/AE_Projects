SELECT id,
       text,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', creation_date) AS creation_date,
       post_id,
       user_id,
       score
FROM {{ source('stackoverflow', 'comments') }} 