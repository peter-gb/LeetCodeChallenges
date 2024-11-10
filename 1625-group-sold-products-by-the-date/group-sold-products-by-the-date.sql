/* 48 SQL 50 */

-- first prepare the data into alphabetical grouping for string agg
with total as (
    select
        sell_date
        ,product
        ,count(distinct product) as count
    from activities
    group by sell_date, product
)
-- then aggregate
select 
     sell_date
    ,sum(count) as num_sold
    ,string_agg(product,',') as products
from total
group by sell_date