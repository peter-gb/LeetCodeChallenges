# 32 SQL 50

select x,y,z,
if(
    (y + z > x)
    and
    (x + z > y)
    and 
    (x + y > z)
,'Yes','No') as triangle 
from triangle
