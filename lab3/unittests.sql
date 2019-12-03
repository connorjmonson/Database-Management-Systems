-- DONE 
--unittests.sql

INSERT INTO ChirpPosts (posterID, postNum, thePost)
		VALUES (321, 987, 'My name is Connor');

INSERT INTO ChirpFollowers (userID, followerID)
		VALUES (987, 555);

INSERT INTO ChirpFollowers (userID, followerID)
		VALUES (444, 333); 

UPDATE ChirpReads
SET timesRead = 1;

UPDATE ChirpReads
SET timesRead = -1;

UPDATE ChirpUsers
SET userID = 124
WHERE spouseID = 120;

UPDATE ChirpUsers
SET userID = 120
WHERE spouseID = 120;

UPDATE ChirpUsers
SET active = NULL, joinDate = NULL;
--WHERE joinDate = NULL;

UPDATE ChirpUsers
SET active = 'FALSE', joinDate = NULL;
--WHERE joinDate = NULL;

--psql:unittests.sql:4: ERROR:  insert or update on table "chirpposts" violates foreign key constraint "chirpposts_posterid_fkey"
--DETAIL:  Key (posterid)=(321) is not present in table "chirpusers".
--psql:unittests.sql:7: ERROR:  insert or update on table "chirpfollowers" violates foreign key constraint "chirpfollowers_userid_fkey"
--DETAIL:  Key (userid)=(987) is not present in table "chirpusers".
--psql:unittests.sql:10: ERROR:  insert or update on table "chirpfollowers" violates foreign key constraint "chirpfollowers_userid_fkey"
--DETAIL:  Key (userid)=(444) is not present in table "chirpusers".
--UPDATE 174
--psql:unittests.sql:16: ERROR:  new row for relation "chirpreads" violates check constraint "positive_reads"
--DETAIL:  Failing row contains (124, 575, 125, -1, 2018-03-31).
--UPDATE 1
--psql:unittests.sql:24: ERROR:  new row for relation "chirpusers" violates check constraint "id_same"
--DETAIL:  Failing row contains (120, xL3qpMmW, Vernon, 2015-02-06, 4 Privet Drive, Surrey, U, 55838.60, 120, t).
--UPDATE 27
--psql:unittests.sql:31: ERROR:  new row for relation "chirpusers" violates check constraint "check_null"
--DETAIL:  Failing row contains (101, jSoRP2c7, Sirius, null, 12 Grimauld Pl. London, H, 4343.45, null, f).