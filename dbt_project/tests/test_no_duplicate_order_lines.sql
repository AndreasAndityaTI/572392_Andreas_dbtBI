select
    order_id,
    product_id,
    count(*) as dup_count
from {{ ref('stg_superstore') }}
group by 1, 2
having count(*) > 1
