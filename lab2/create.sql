DROP SCHEMA Lab2 CASCADE; 
CREATE SCHEMA Lab2;
ALTER ROLE cmonson SET SEARCH_PATH to Lab2;

CREATE TABLE ChirpUsers(
	userID				INTEGER, 
	userPassword		CHAR(8)  NOT NULL, 
	userName			VARCHAR(30) NOT NULL, 
	joinDate			DATE, 
	address				VARCHAR(30), 
	education			CHAR(1), 
	income				DECIMAL(10,2), 
	spouseID			INTEGER,
	active				BOOLEAN,
	UNIQUE (userName),
	UNIQUE (spouseID),
	UNIQUE (joinDate, address),
	PRIMARY KEY (userID)
); 

CREATE TABLE ChirpPosts(
	posterID			INTEGER, 
	postNum				INTEGER, 
	thePost				VARCHAR(44) NOT NULL, 
	censored			BOOLEAN, 
	postDate			DATE,
	PRIMARY KEY (posterID, postNum)
);

CREATE TABLE ChirpFollowers(
	userID				INTEGER, 
	followerID			INTEGER, 
	followStartDate		DATE,
	PRIMARY KEY (userID, followerID)
);

CREATE TABLE ChirpReads(
	posterID			INTEGER, 
	postNum				INTEGER, 
	postReader			INTEGER, 
	timesRead			INTEGER, 
	latestReadDate		DATE,
	PRIMARY KEY (posterID, postNum, postReader)
);