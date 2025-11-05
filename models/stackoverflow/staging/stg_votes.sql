SELECT id,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', creation_date) as creation_date,
       post_id,
       vote_type_id
FROM {{ source('stackoverflow', 'votes') }} 