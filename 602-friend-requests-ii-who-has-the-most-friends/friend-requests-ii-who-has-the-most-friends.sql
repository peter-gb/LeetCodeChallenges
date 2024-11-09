/* 41 SQL 50 */

with friends as(
    select requester_id as id from requestaccepted
    union all 
    select accepter_id as id from requestaccepted
)

select top (1)
    id, count(id) as num
from friends
group by id
order by num desc
