# 29 SQL 50

with possprods as (
    select count(distinct product_key) as countprods
    from product
)
, custprods as(


select
     customer_id
    ,count(distinct product_key) as custprods
from customer 
group by customer_id
)

select 
    c.customer_id
from custprods c
join possprods p
on c.custprods = p.countprods