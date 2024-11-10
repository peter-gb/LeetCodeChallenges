/* 50 SQL 50 */

select * 
from users
-- must start with a letter and end in @leetcode.com
where mail like '[a-zA-Z]%@leetcode.com' 
-- must not contain things other than a-z A-Z _ - . 0-9
AND mail NOT LIKE '%[^a-zA-Z0-9_.-]%@leetcode.com'