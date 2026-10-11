
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  select
    order_id,
    product_id,
    count(*) as dup_count
from "warehouse"."main"."stg_superstore"
group by 1, 2
having count(*) > 1
  
  
      
    ) dbt_internal_test