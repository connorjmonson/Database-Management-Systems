-- query3.sql
SELECT c1.userID AS FirstUser, c2.userID AS SecondUser 
FROM ChirpFollower c1 
WHERE ChirpFollower c2 IN (SELECT )
c1.userID=c2.userID AND c1.followerID=c2.followerID;