# 12 SQL 50

with exams as (
    select
    student_id
    ,subject_name
    ,count(*) as attended_exams
    from examinations
    group by student_id, subject_name
    order by student_id, subject_name
)
    select 
        distinct s.student_id
        ,s.student_name
        ,su.subject_name
        ,ifnull(e.attended_exams,0) as attended_exams
    from students s
    cross join subjects su
    left join exams e
    on s.student_id = e.student_id
    and su.subject_name = e.subject_name
    order by s.student_id, su.subject_name


