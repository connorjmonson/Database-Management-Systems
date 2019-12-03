-- DONE 
-- a) The posterID field in ChirpPosts should reference the userID primary key in ChirpUsers.
ALTER TABLE ChirpPosts
		ADD FOREIGN KEY (posterID) REFERENCES ChirpUsers (userID);

-- b) The userID field in ChirpFollowers should reference the userID primary key in ChirpUsers.
ALTER TABLE ChirpFollowers
		ADD FOREIGN KEY (userID) REFERENCES ChirpUsers (userID);

-- c) The followerID field in ChirpFollowers should reference the userID primary key in ChirpUsers.
ALTER TABLE ChirpFollowers
		ADD FOREIGN KEY (followerID) REFERENCES ChirpUsers (userID);