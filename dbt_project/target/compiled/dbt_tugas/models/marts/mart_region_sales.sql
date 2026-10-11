with regional_summary as (
    select
        region,
        count(distinct order_id) as order_count,
        sum(sales) as total_sales,
        sum(profit) as total_profit,
        avg(discount) as avg_discount,
        count(*) as line_count
    from "warehouse"."main"."stg_superstore"
    where region is not null
    group by region
)
select *
from regional_summary
order by total_sales desc