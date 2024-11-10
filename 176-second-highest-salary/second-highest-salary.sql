/* 47 SQL 50 */

-- Summarise all salaries
with salaries as (
    select distinct salary
    from employee
)
-- Rank all the salaries
, ranks as (
    select 
     salary
     ,rank() over ( order by salary desc) as rank
    from salaries
)
-- Provide a row for null if there is no rank 2
, scaffold as (
    select top (1) 2 as nullrank from employee
)
 , final as (-- find the second highest, null if none
select r.salary as SecondHighestSalary
from ranks r
full outer join scaffold s
on r.rank = s.nullrank
where nullrank = 2
 )

-- deal with having an empty table in the original table
 select max(SecondHighestSalary) as SecondHighestSalary from final