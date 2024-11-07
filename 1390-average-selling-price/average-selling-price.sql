# 16 SQL 50
 
select
     p.product_id
    ,ifnull(round(sum(u.units * p.price) / sum(u.units),2),0) as average_price    
from 
prices p
left join unitssold u
on u.product_id = p.product_id
where (u.purchase_Date >= p.start_date and u.purchase_date <= p.end_Date)
or isnull(u.purchase_date)
group by u.product_id
