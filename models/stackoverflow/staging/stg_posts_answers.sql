SELECT * 
FROM {{ source('stackoverflow', 'posts_answers') }} 