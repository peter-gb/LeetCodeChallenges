# 25 SQL 50
 
 with first as (
    select product_id, min(year) as minyear from sales group by product_id
 )
 select 
     s.product_id
    ,f.minyear as first_year
    ,s.quantity
    ,s.price
from sales s
join first f
on s.product_id = f.product_id
and s.year = f.minyear