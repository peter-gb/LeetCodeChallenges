/* 35 SQL 50 */
with high as (
    select * from accounts
    where income > 50000
), med as (
    select * from accounts
    where income <= 50000
    and income >= 20000
),low as (
    select * from accounts
    where income < 20000
), salaries as (
    select 'High Salary' as category, count(*) as accounts_count from high
    union
    select 'Average Salary' as category, count(*) as accounts_count from med
    union
    select 'Low Salary' as category, count(*) as accounts_count from low
)
select * from salaries order by accounts_count desc