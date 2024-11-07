# 34 SQL 50

# find the most recent change date up to the chosen date per product
with dates as (
    select product_id, max(change_date) date from products
    where change_date <= '2019-08-16'
    group by product_id
), 
# get unique list of products to build table from
prodlist as (
    select distinct product_id from products 
)

# fetch prices based on max date, if max date does not exist, then 10
select 
     l.product_id
    ,ifnull(new_price,10) as price
from prodlist l
left join dates d
    on l.product_id = d.product_id
left join products p
    on d.product_id = p.product_id
    and d.date = p.change_date