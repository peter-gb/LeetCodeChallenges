# 13 SQL 50
 
select m.name
from employee e
join employee m
on e.managerID = m.id
group by e.managerID
having count(e.managerID) >= 5