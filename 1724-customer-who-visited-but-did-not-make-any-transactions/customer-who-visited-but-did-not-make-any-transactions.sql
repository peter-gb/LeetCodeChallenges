# 8 SQL 50
 
select
     v.customer_id
    ,count(*) as count_no_trans
from visits v
left join transactions t on v.visit_id = t.visit_id
where isnull(t.visit_id)
group by customer_id