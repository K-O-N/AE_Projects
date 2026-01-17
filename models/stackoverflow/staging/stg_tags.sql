SELECT tag_name,
       count,
       excerpt_post_id,
       wiki_post_id
FROM {{ source('stackoverflow', 'tags') }} 