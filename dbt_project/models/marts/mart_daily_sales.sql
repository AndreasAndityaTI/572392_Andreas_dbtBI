with daily_sales as (
    select
        order_date,
        count(distinct order_id) as order_count,
        count(*) as line_count,
        sum(sales) as total_sales,
        sum(profit) as total_profit,
        sum(quantity) as total_quantity,
        avg(discount) as avg_discount
    from {{ ref('stg_superstore') }}
    where order_date is not null
    group by order_date
)
select *
from daily_sales
order by order_date
