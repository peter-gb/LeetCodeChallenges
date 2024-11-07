# 4 SQL 50

SELECT DISTINCT 
author_id as id
FROM  views
WHERE author_id=viewer_id
ORDER BY id asc