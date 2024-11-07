# 19 SQL 50
 
select
    query_name
    , round( avg(rating / position), 2) as quality
    ,  round( avg(if(rating<3,1,0)) *100, 2) as poor_query_percentage
from queries
where not isnull(query_name)
group by query_name