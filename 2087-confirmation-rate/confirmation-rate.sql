# 14 SQL 50
 
with usr as(
    select 
        user_id
    from signups
    group by user_id
), 
conf as(
    select 
         user_id
        ,count(*) as confirmations
        from confirmations c
        where action <> 'timeout'
        group by user_id
), 
req as(
    select 
         user_id
        ,count(*) as requests
        from confirmations c
        group by user_id
)
select 
    u.user_id
    ,ifnull(round((c.confirmations/r.requests),2),0) as confirmation_rate
from usr u
left join req r
on u.user_id = r.user_id
left join conf c
on u.user_id = c.user_id
