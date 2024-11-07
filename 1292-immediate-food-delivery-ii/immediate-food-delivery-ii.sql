# 21 SQL 50
 
with first as(
    select 
        customer_id
        ,MIN(order_date) as first_orderdate
    from delivery
    group by customer_id
)
select 
     round(100*(sum(if(d.order_date = d.customer_pref_delivery_date, 1, 0)) 
     / count(*)),2) as immediate_percentage
from delivery d
inner join first f
on d.customer_id = f.customer_id
and d.order_date = f.first_orderdate