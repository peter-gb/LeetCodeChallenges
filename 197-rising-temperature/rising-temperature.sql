# 9 SQL 50
 
select 
    t.id
From weather t
left join weather y 
on t.recordDate = DATE_ADD(y.recordDate, INTERVAL 1 DAY)
where (t.temperature  - y.temperature ) > 0