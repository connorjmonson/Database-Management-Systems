import java.sql.*;
import java.util.*;

//Connor Monson
//cmonson

// *** USED BASIS CODE FROM SAMVID LAB SECTION ***

/**
 * The class implements methods of the ChirpBase database interface.
 *
 * All methods of the class receive a Connection object through which all
 * communication to the database should be performed. Note: the
 * Connection object should not be closed by any method.
 *
 * Also, no method should throw any exceptions. In particular, in case
 * an error occurs in the database, then the method should print an
 * error message and call System.exit(-1);
 */

public class ChirpApplication {

    private Connection connection;

    /*
     * Constructor
     */
    public ChirpApplication(Connection connection) {
        this.connection = connection;
    }

    public Connection getConnection()
    {
        return connection;
    }

    /**
     * Takes as argument a string called theAddress.
     * Returns the userID for each tuple in ChirpUsers
     * whose address attribute value is theAddress.
     */

    public List<Integer> getUsersByAddress(String theAddress)
    {
        List<Integer> result = new ArrayList<Integer>();
        // your code here
        String query = "SELECT userID FROM ChirpUsers WHERE address = ?";
        //String query = "SELECT userID FROM ChirpUsers WHERE address = " + theAddress;
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setString(1, theAddress);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                result.add(rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // end of your code
        return result;
    }


    /**
     * The ChirpUsers table has a Boolean attribute called active.  We’ll say that a
     * user is active if the value of active is TRUE, and we’ll say that a user is inactive
     * if that attribute is FALSE.  There may be some active users who haven’t made any posts
     * after December 31, 2016.  Update the ChirpUsers rows for these users so that they
     * become inactive.  (Don’t update rows of users that were already inactive.)
     * makeUsersInactive should return the number of users who were made inactive by your update.
     */
    
    public int makeUsersInactive() {
        // your code here; return 0 appears for now to allow this skeleton to compile.
        int result = 0;
        //need to fix query UPDATE
        // want to set active = false where active is currently true and 
        // the latest post by the user was made before or on December 31, 2016. 
        // =<"12-31-2016"
        //this query currently changes 7 active= false tuples to active = true
        //String query = "UPDATE ChirpUsers SET active = 'TRUE' WHERE active = 'FALSE'";

        //** Try #1 **
        //String query = "UPDATE ChirpUsers SET active = 'FALSE' WHERE active = 'TRUE' AND" + 
        //"'2016-12-31' > (SELECT Max(p.postDate) FROM ChirpPosts p, ChirpUsers u WHERE p.posterID = u.userID)";

        //** Try #2 **
        //String query = "UPDATE ChirpUsers SET active = 'FALSE' WHERE active = 'TRUE' AND " + 
        //"'2016-12-31' < (SELECT postDate FROM ChirpPosts)";        
        // 2017-01-01 or 2016-12-31 ?

        //** Try #3 **
        //seems like it should work
        String query = "UPDATE ChirpUsers SET active = 'FALSE' WHERE active = 'TRUE' AND " +
        "userID NOT IN (SELECT p.posterID FROM ChirpPosts p, ChirpUsers u WHERE p.posterID = u.userID AND p.postDate > '2016/12/31')";

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            result += ps.executeUpdate();
            // result = result + ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;



        // end of your code
    }


    /**
     * The purgeBadUsers method has has one integer parameter, censorLimit.  It invokes a
     * stored function purgeBadFunction that you will need to implement and store in the
     * database according to the description that appears in Section 5.
     * purgeBadFunction should take have the same parameter, censorLimit.  It will take
     * actions to purge all information about certain users from the database.
     * Section 5 explains which users will be purged, and what purging means.
     *
     * purgeBadFunction returns an integer value, and the purgeBadUsers method should
     * return the same integer value.
     */

    public int purgeBadUsers(int censorLimit)
    {
        // There's nothing special about the name storedFunctionResult
        int storedFunctionResult = 0;

        // your code here
        //seems like it will work if purgeBadFunction(censorLimit) works
        String query = "SELECT purgeBadFunction(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, censorLimit);
            ResultSet rs = ps.executeQuery();
            rs.next();
            storedFunctionResult = rs.getInt(1);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // end of your code
        return storedFunctionResult;

    }

};
