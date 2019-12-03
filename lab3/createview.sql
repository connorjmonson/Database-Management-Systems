-- DONE
-- createview.sql

CREATE VIEW ManyFollowers AS
	SELECT userID, COUNT(*) AS numberOfFollowers
	FROM ChirpFollowers
	WHERE userID IN (SELECT userID FROM ChirpUsers WHERE userName <> 'Voldemort' AND userName <> 'Malfoy')
	GROUP BY userID
	HAVING COUNT (followerID) >= 3;
--my code uses a subquery which made it easier for me to understand 

-- previous code that I was using

--CREATE VIEW ManyFollowers AS 
--	SELECT u.userID, COUNT(*) AS numberOfFollowers
--	FROM ChirpUsers u, ChirpFollowers f 
--	WHERE u.userID = f.userID AND u.userName <> 'Voldemort' 
--	AND u.userName <> 'Malfoy'
--	GROUP BY u.userID
--	HAVING COUNT (f.followerID) >= 3; 