-- query1.sql
SELECT userName, joinDate
FROM ChirpUsers
WHERE address LIKE '%West%'
ORDER BY joinDate desc;