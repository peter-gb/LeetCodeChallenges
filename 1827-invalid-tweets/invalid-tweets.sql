# 5 SQL 50

WITH count as(
SELECT tweet_id,content
FROM TWEETS
HAVING LENGTH(content) >15
)
SELECT tweet_id
FROM count