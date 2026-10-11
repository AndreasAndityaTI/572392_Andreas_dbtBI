select
    order_id,
    product_id,
    count(*) as dup_count
from "warehouse"."main"."stg_superstore"
group by 1, 2
having count(*) > 1