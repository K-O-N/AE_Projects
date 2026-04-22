select *
from {{ ref('order_status_snapshots') }}
where id = 41679