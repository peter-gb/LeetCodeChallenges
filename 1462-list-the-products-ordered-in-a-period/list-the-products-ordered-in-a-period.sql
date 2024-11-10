/* 49 SQL 50 */

select 
      p.product_name
      ,sum(unit) as unit
from orders o
join products p
on o.product_id = p.product_id
where year(o.order_date) = 2020 
and month(o.order_Date) = 2
group by left(o.order_date,7), p.product_name
having sum(o.unit) >= 100