/* 44 SQL 50 */

select 
    user_id
    ,concat(
        upper(left(name,1))
        ,lower(substring(name,2,999))
    ) as name 
from users
order by user_id