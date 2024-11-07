# 23 SQL 50
 
 select 
     teacher_id
    ,count(distinct subject_id) as cnt
from teacher
group by teacher_id
