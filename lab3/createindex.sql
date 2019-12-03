-- DONE

--createindex.sql
CREATE INDEX LookUpPosts 
ON ChirpPosts (posterID, postDate);

-- this code below would create a unique index on a table where duplicate values are not allowed

-- CREATE UNIQUE INDEX LookUpPosts 
-- ON ChirpPosts (posterID, postDate);