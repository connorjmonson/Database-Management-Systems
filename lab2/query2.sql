-- query2.sql
SELECT a.userName, b.thePost
FROM ChirpUsers a, ChirpPosts b
WHERE a.income > 50000 AND a.active = 'true' AND b.cencored = 'false'; 