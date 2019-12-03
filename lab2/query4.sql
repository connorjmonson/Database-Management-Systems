-- query4.sql
SELECT DISTINCT x.userName, x.address 
FROM ChirpUsers x, ChirpReads y, ChirpPosts z
WHERE x.userID = y.postReader AND y.posterID = z.posterID AND x.userName = “Bill”; 


--Find the name and address of Readers 
--who have read posts written by a user whose name is 'Bill'. 
--Your result should not have any duplicates.