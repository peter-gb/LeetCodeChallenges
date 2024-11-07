# 7 SQL 50
 
select
    p.product_name
    ,s.year
    ,s.price
from sales s
left join product p
on s.product_id = p.product_id