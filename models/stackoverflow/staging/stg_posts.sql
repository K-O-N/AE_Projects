{{ config(materialized='view') }}

with posts as (

    select *
    FROM bigquery-public-data.stackoverflow.post_history h
    LEFT JOIN bigquery-public-data.stackoverflow.posts_answers p
    ON h.post_id = p.id 

)
select *
from posts 
