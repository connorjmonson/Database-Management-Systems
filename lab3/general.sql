-- CHECK IF DONE!!!

--1. In ChirpReads, timesRead must be positive. 
-- Please give a name to this constraint when you create it. 
-- We recommend that you use the name positive_reads, but you may use another name. 
-- (The other constraints don’t need to have names.)
ALTER TABLE ChirpReads
		ADD CONSTRAINT positive_reads
		CHECK (timesRead>=0); --can it be 0?

--2. In ChirpUsers, userID and spouseID must not be the same.
ALTER TABLE ChirpUsers
		ADD CONSTRAINT id_same
		CHECK (userID <> spouseID);

--3. In ChirpUsers, if joinDate is NULL, then active must also be NULL.
ALTER TABLE ChirpUsers
		ADD CONSTRAINT check_null
		--CHECK (CASE WHEN joinDate IS NULL THEN SET active = NULL END);
		CHECK (CASE WHEN joinDate IS NULL THEN active IS NULL END); --check 
	-- used similar sintax as seen on:
	-- https://community.modeanalytics.com/sql/tutorial/sql-case/