/* 38 SQL 50 */

select a.id,
    iif(b.id is null and a.id%2=1,a.student,
        iif(a.id%2=0,c.student,b.student)
        ) as student 
from seat a
left join seat b
on a.id + 1 = b.id
left join seat c
on a.id - 1 = c.id