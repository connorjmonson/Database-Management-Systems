CREATE OR REPLACE function purgeBadFunction(censorLimit integer)
RETURNS integer AS $$
	DECLARE result integer;
	
	BEGIN
		DELETE FROM ChirpUsers
		WHERE userID IS 
			(SELECT posterID 
			FROM ChirPosts 
			WHERE censored  = censorLimit);

		UPDATE ChirpUsers
		SET spouseID = NULL
		WHERE 
		
		DELETE FROM ChirpPosts
		WHERE 

		DELETE FROM ChirpFollowers
		WHERE 		

		GET DIAGNOSTICS result = ROW_COUNT;
		return result;

END;
$$
LANGUAGE plpgsql
