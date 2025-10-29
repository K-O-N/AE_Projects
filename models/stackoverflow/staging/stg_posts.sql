

with posts as (

    select *
    FROM {{ source('stackoverflow', 'post_history') }} h
    LEFT JOIN {{ source('stackoverflow', 'posts_answers') }} p
    ON h.post_id = p.id 

)
select *
from posts 
