/*  39 SQL 50 */

with topname as (
    select top(1) name, count(*) as count
    from movierating r
    join users u
    on u.user_id = r.user_id
    group by name
    order by count desc, name asc    
)
, toptitle as(
    select top(1) title, avg(cast( rating as float)) as avrating
    from movierating r
    join movies m
    on r.movie_id = m.movie_id
    where year(created_at)=2020
    and month(created_at)=2
    group by title
    order by avrating desc, title asc
)
select name as results from topname
union all
select title as results from toptitle