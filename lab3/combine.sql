--FINAL GOT IT 
--got help from TA on syntax for the WHERE and SELECT clause 

--combine.sql

--a) If there isn’t already a tuple in ChirpReads that has the same primary key,
--then insert a tuple into the ChirpReads table corresponding to that tuple in the NewReads table, 
--with timesRead set to 1 and latestReadDate set to the readDate in the NewReads tuple.

--UPDATE ChirpReads
--SET timesRead += 1, latestReadDate = readDate
--WHERE 

-- *** this should add rows into ChirpReads-->  97 - (# of rows with a primary key that is already in ChirpReads)  ***
INSERT INTO ChirpReads --(posterID, postNum, postReader, timesRead, latestReadDate)
SELECT n.posterID, n.postNum, n.postReader, 1, n.readDate 
FROM NewReads n
WHERE (n.posterID, n.postNum, n.postReader) NOT IN (
	SELECT c.posterID, c.postNum, c.postReader FROM ChirpReads c);
--WHERE posterID != posterID 
--AND postNum != postNum 
--AND postReader != postReader;


--INSERT INTO ChirpReads (posterID, postNum, postReader, latestReadDate)
--SELECT posterID, postNum, postReader, readDate 
--FROM NewReads
--WHERE NOT EXISTS (SELECT * 
--					FROM ChirpReads c, NewReads n 
--					WHERE c.posterID = n.posterID 
--					AND c.postNum = n.postNum
--					AND c.postReader = n.PostReader); 

--b) If there is already a tuple in ChirpReads that has the same primary key, 
--then update ChirpReads, adding 1 to timesRead and setting latestReadDate to be the readDate 
--in the NewReads tuple. (We’re assuming that NewReads always have a later value for readDate.)

-- *** this should update -->  97 - (# of rows NOT already in ChirpReads) ***
UPDATE ChirpReads
SET timesRead = timesRead + 1, latestReadDate = n.readDate 
FROM NewReads n
WHERE (n.posterid, n.postNum, n.postReader) IN (
	SELECT c.posterID, c.postNum, c.postReader 
	FROM ChirpReads c
	WHERE n.posterID = c.posterID 
	AND n.postNum = c.postNum
	AND n.postReader = c.PostReader);

			--(SELECT * 
			--		FROM ChirpReads c, NewReads n 
			--		WHERE c.posterID = n.posterID 
			--		AND c.postNum = n.postNum
			--		AND c.postReader = n.PostReader); 

--SET timesRead += 1, latestReadDate = NewReads.readDate
--final results =
--INSERT 0 90
--UPDATE 264