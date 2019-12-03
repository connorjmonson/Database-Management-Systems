-- DONE

--queryview.sql
-- For users that have many followers, output that user’s userID, the date of that user’s earliest
-- post, the date of that user’s latest post, and that user’s numberOfFollowers (as it appears in
-- ManyFollowers). The attributes in your result should be called userID, earliestPostDate,
-- latestPostDate and numberOfFollowers.

--SELECT p.posterID, MIN(p.postDate) AS earliestPostDate, MAX(p.postDate) AS latestPostDate, COUNT(*) AS numberOfFollowers
--FROM ChirpPosts p
--WHERE p.posterID IN (SELECT m.userID FROM ManyFollowers m) --dont need the m really
--GROUP BY p.posterID; 

SELECT m.userID, MIN(p.postDate) AS earliestPostDate, MAX(p.postDate) AS latestPostDate, m.numberOfFollowers
FROM ChirpPosts p, ManyFollowers m
WHERE m.userID = p.posterID
GROUP BY m.userID, m.numberOfFollowers;
-- this only outputs 13 because userID = 113 never made a post before.
-- OUTPUT before deletion: 
--  userid | earliestpostdate | latestpostdate | numberoffollowers 
--------+------------------+----------------+-------------------
--    123 | 2016-06-05       | 2017-08-02     |                 4
--    114 | 2016-01-25       | 2017-06-18     |                 3
--    107 | 2016-08-12       | 2017-12-09     |                 4
--    119 | 2016-08-07       | 2017-03-29     |                 4
--    106 | 2016-01-31       | 2017-04-20     |                 3
--    120 | 2016-03-07       | 2016-09-20     |                 6
--    104 | 2017-02-04       | 2017-02-04     |                 4
--    103 | 2016-12-24       | 2017-11-20     |                 3
--    112 | 2016-01-29       | 2017-12-25     |                 3
--    111 | 2016-12-13       | 2017-12-18     |                 5
--    122 | 2016-05-18       | 2017-12-13     |                 5
--    105 | 2016-07-14       | 2017-12-27     |                 3
--    108 | 2017-12-24       | 2017-12-24     |                 3  

--write commands that delete just the tuples with 
--the following primary keys from the ChirpFollowers table:
DELETE FROM ChirpFollowers
	WHERE userID = 120 AND followerID = 105;

DELETE FROM ChirpFollowers
	WHERE userID = 103 AND followerID = 111;

SELECT m.userID, MIN(p.postDate) AS earliestPostDate, MAX(p.postDate) AS latestPostDate, m.numberOfFollowers
FROM ChirpPosts p, ManyFollowers m
WHERE m.userID = p.posterID
GROUP BY m.userID, m.numberOfFollowers;

-- OUTPUT AFTER DELETION:
--DELETE 1
--DELETE 1
-- userid | earliestpostdate | latestpostdate | numberoffollowers 
--------+------------------+----------------+-------------------
--    123 | 2016-06-05       | 2017-08-02     |                 4
--    114 | 2016-01-25       | 2017-06-18     |                 3
--    107 | 2016-08-12       | 2017-12-09     |                 4
--    119 | 2016-08-07       | 2017-03-29     |                 4
--    106 | 2016-01-31       | 2017-04-20     |                 3
--    104 | 2017-02-04       | 2017-02-04     |                 4
--    120 | 2016-03-07       | 2016-09-20     |                 5
--    112 | 2016-01-29       | 2017-12-25     |                 3
--    111 | 2016-12-13       | 2017-12-18     |                 5
--    122 | 2016-05-18       | 2017-12-13     |                 5
--    105 | 2016-07-14       | 2017-12-27     |                 3
--    108 | 2017-12-24       | 2017-12-24     |                 3

-- since userID = 103 had a follwer deleted and previously only had 3 followers (3-1= 2)
-- now userID = 103 only has 2 followers so they are no longer included in ManyFollowers
-- also we see the # of followers for userID = 120 go down to 5 followers
