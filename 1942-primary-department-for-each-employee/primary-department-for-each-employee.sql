# 31 SQL 50

# find employees with only 1 dept
with singles as (
    select employee_id, count(*) 
    from employee
    group by employee_id
    having count(*) = 1 
)
# filter original list to primary flag = y for multi dept employees
# and join the singles IDs to identify those employees with just one dept, and keep them too
select
    e.employee_id
    , e.department_id
from employee e
left join singles s
on e.employee_id = s.employee_id
where primary_flag = 'Y'
or s.employee_id is not null
