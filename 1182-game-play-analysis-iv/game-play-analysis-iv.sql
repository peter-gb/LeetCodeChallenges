# 22 SQL 50
 
with first as(
    select 
         player_id
        ,min(event_date) as first_login
        ,date_add(min(event_date),interval 1 day) as second_login
    from activity
    group by player_id
)

# logged in the day after they logged in?
select 
    round(
    count( distinct if(a.player_id = b.player_id and a.player_id = f.player_id, f.player_id,NULL)) 
    / count(distinct a.player_id) ,2) as fraction 
from activity a
left join activity b
on a.player_id = b.player_id
and date_add(a.event_date,interval 1 day) = b.event_date 

left join first f
on a.player_id = f.player_id
and a.event_date = f.first_login

