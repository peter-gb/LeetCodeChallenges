/* 43 SQL 50 */

with ranking as ( 
    select 
         name as Employee 
        ,salary as Salary
        ,departmentid
    , dense_rank() over (
        partition by departmentid
        order by salary desc
        ) as rank
    from employee
)
select 
     d.name as Department
     ,r.Employee
     ,r.Salary 
from ranking r
join department d
on r.departmentid = d.id
where rank <= 3