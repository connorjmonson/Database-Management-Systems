-- query5.sql
SELECT a.userID, a.userName
FROM ChirpUsers a, ChirpReads b
WHERE a.userID = b.posterID AND timesRead > 1;

--USE EXISTS KEY WORD
