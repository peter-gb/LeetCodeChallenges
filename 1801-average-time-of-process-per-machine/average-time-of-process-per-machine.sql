# 10 SQL 50
 
select 
machine_id 
, round(
    sum(if(activity_type='end',timestamp,-timestamp)) 
    / count( distinct process_id)
,3) as processing_time
from activity
group by machine_id