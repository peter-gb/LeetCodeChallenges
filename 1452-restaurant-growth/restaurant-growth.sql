/* 40 SQL 50 */

with dailysales as (
    select visited_on, sum(amount) as amount
    from customer
    group by visited_on
)

select 
    visited_on 
    , sum(amount) over (
        order by visited_on
        rows between 6 preceding and current row
    ) as amount
    , round(avg(amount*1.00) over (
        order by visited_on
        rows between 6 preceding and current row 
    ) ,2) as average_amount
from dailysales
order by visited_on
offset 6 rows
