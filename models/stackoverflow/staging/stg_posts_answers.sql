SELECT id,
       body,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', creation_date) as creation_date,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', last_activity_date) as last_activity_date,
       FORMAT_TIMESTAMP('%Y-%m-%d %H:%M:%S', last_edit_date) as last_edit_date,
       owner_user_id,
       parent_id,
       post_type_id,
       score
FROM {{ source('stackoverflow', 'posts_answers') }} 