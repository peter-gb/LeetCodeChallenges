/* 42 SQL 50 */

-- must not be a unique value of tiv2015, find pids to use
with unique15 as(
    select distinct a.pid
    from insurance a
    join insurance b
    on a.tiv_2015 = b.tiv_2015
    where a.pid != b.pid
)

-- lat and lon must be unique, find pids to use
, uniquell as (
    select distinct a.pid
    from insurance a
    left join insurance b
    on a.lat = b.lat
    and a.lon = b.lon
    and a.pid != b.pid
    where b.pid is null
)
 --select * from unique15

--using joins on relevant pids, summarise 
select round( sum(tiv_2016) ,2) as tiv_2016 
from insurance i
join unique15 u
on i.pid = u.pid
join uniquell uu
on i.pid = uu.pid
