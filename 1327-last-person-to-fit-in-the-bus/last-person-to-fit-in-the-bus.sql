# 35 SQL 50

with cumulative_weight as(
    select 
        *
        ,sum(weight) over (order by turn) as cum_weight
    from queue
    order by turn asc
)
select person_name from cumulative_weight
where cum_weight <= 1000
order by cum_weight desc
limit 1;