SELECT ph.post_id,
       ph.creation_date,
       post_history_type_id,
       revision_guid,
       ph.user_id,
       ph.text,
       comment,
       score

FROM {{ ref('stg_post_history') }} ph 
left join {{ ref('stg_comments') }} cc 
ON ph.post_id = cc.post_id