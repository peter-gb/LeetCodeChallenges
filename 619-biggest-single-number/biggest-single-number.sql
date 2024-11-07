# 28 SQL 50

select(
    select num
    from mynumbers
    group by num
    having count(*) = 1
    order by num desc
    limit 1
) as num
from mynumbers
limit 1