with source as (
    select *
    from {{ source('raw', 'superstore') }}
),
cleaned as (
    select
        cast("Row ID" as bigint) as row_id,
        trim("Order ID") as order_id,
        try_cast("Order Date" as date) as order_date,
        try_cast("Ship Date" as date) as ship_date,
        trim("Customer ID") as customer_id,
        trim("Customer Name") as customer_name,
        trim("Segment") as segment,
        trim("Country") as country,
        trim("City") as city,
        trim("State") as state,
        nullif(trim(cast("Postal Code" as varchar)), '') as postal_code,
        trim("Region") as region,
        trim("Product ID") as product_id,
        trim("Category") as category,
        trim("Sub-Category") as sub_category,
        trim("Product Name") as product_name,
        cast("Sales" as numeric(18,2)) as sales,
        cast("Quantity" as integer) as quantity,
        cast("Discount" as numeric(18,2)) as discount,
        cast("Profit" as numeric(18,2)) as profit,
        concat(trim("Order ID"), '|', trim("Product ID")) as order_product_key
    from source
),
deduped as (
    select *,
           row_number() over (
               partition by order_id, product_id
               order by order_date desc, row_id desc
           ) as row_num
    from cleaned
)
select
    row_id,
    order_id,
    order_date,
    ship_date,
    customer_id,
    customer_name,
    segment,
    country,
    city,
    state,
    postal_code,
    region,
    product_id,
    category,
    sub_category,
    product_name,
    sales,
    quantity,
    discount,
    profit,
    order_product_key
from deduped
where row_num = 1
