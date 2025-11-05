SELECT id,
       name,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', date) as trans_date,
       user_id,
       class,
       tag_based
FROM  {{ source('stackoverflow', 'badges') }}