# 18 SQL 50
 
select
    contest_id
    ,round(100*(
        count(distinct user_id)
        /(select count(distinct user_id) from users)
    ),2) as percentage
from register
group by contest_id
order by percentage desc, contest_id asc