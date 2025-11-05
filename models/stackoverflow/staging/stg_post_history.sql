select id, 
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', creation_date) as creation_date,
       post_id,
       post_history_type_id,
       revision_guid,
       user_id,
       text,
       comment 
FROM {{ source('stackoverflow', 'post_history') }} 




