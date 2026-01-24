with user_comments as (
    select ph.user_id,
          min(ph.creation_date) as first_comment,
          count(distinct sc.id ) as total_comments,
          sum(sc.score) as total_scores,
          max(sc.score) as max_score
    from {{ ref('stg_post_history') }} ph
    inner join {{ ref('stg_comments') }}  sc on ph.post_id = sc.post_id
    group by all
)

    select su.user_id,
        display_name,
        creation_date,
        location,
        reputation,
        up_votes,
        down_votes,
        views,
        first_comment,
        total_comments,
        total_scores,
        max_score
    from {{ ref('stg_users') }}  su left join user_comments uc on 
    su.user_id = uc.user_id