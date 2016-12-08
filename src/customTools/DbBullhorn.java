package customTools;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Bhpost;

public class DbBullhorn {

	public static int insert(java.util.Date postdate,String posttext,long userid) {
		String sql = "insert into bhpost (postdate,posttext,bhuserid) " + 
				"values(?,?,?)";
		int recordsAffected = 0;
		Connection con = null;
		PreparedStatement pstmt = null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:HR/hr@localhost:1521:xe");
			pstmt = con.prepareStatement(sql);
			pstmt.setDate(1,new java.sql.Date(postdate.getTime()));
			pstmt.setString(2, posttext);
			pstmt.setLong(3, userid);
			recordsAffected = pstmt.executeUpdate();
		}catch (SQLException e) {
			e.printStackTrace();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		return recordsAffected;

	}

	public static void update() {
		
	}

	public static List<Bhpost> AllPosts () throws SQLException, ClassNotFoundException{
		List<Bhpost> posts = new ArrayList<Bhpost>();
		String sql = "select postid,postdate,posttext,bhuserid from bhpost";
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:HR/hr@localhost:1521:xe");
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		// Fetch each row from the result set
		while (rs.next()) {
		  long postid = rs.getInt("postid");
		  java.util.Date postdate = rs.getDate("postdate");
		  String posttext = rs.getString("posttext");
		  long userid = rs.getLong("bhuserid");

		  Bhpost p = new Bhpost();
		  p.setPostid(postid);
		  p.setPostdate(convertJavaDateToSqlDate(postdate));
		  p.setPosttext(posttext);
		  p.setBhuserid(userid);
		  //add the post to the arraylist
		  posts.add(p);
		}
		return posts;
	}
	
	public static List<Bhpost> postsofUser(long userid)
	{
		List<Bhpost> userposts = new ArrayList<Bhpost>();
	
		//not implemented
		return userposts;	
	}
	public static List<Bhpost> postsofUser(String useremail)
	{
		List<Bhpost> userposts = new ArrayList<Bhpost>();
		//not implemented
		return userposts;	
	}
	
	public static List<Bhpost> searchPosts (String search)
	{
	
		List<Bhpost> posts = new ArrayList<Bhpost>();
		//lower, rtrim and ltrim are sql functions to remove leading and
		//trailing spaces and also make the post all lower case.
		//sql isn't normally case-sensitive but the database may be set up
		//such case does matter. We just make everything lower case and then
		//remove some special characters to clean up the input and increase
		//the likelihood of a match.
		String sql = "select postid,postdate,posttext,bhuserid from Bhpost "
				+ "where lower(rtrim(ltrim(posttext))) like ?";
		ResultSet rs = null;
		Connection con = null;
		PreparedStatement pstmt = null;

		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:HR/hr@localhost:1521:xe");
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,"%" + likeSanitize(search.toLowerCase()) + "%");

			rs = pstmt.executeQuery();
			// Fetch each post from the result set
			// and add each post to an arrayList called posts
			while (rs.next()) {
				 long postid = rs.getInt("postid");
				 java.util.Date postdate = rs.getDate("postdate");
				 String posttext = rs.getString("posttext");
				 long userid = rs.getLong("bhuserid");
				
				 Bhpost p = new Bhpost();
				 p.setPostid(postid);
				 p.setPostdate(convertJavaDateToSqlDate(postdate));
				 p.setPosttext(posttext);
				 p.setBhuserid(userid);
				 //add the post to the arraylist
				 posts.add(p);
			}
		}catch(Exception e){
			
		}
			
			
	    return posts;
	}
	private static String likeSanitize(String input) {
		//clean up the input to remove special characters
	    return input
	       .replace("!", "!!")
	       .replace("%", "!%")
	       .replace("_", "!_")
	       .replace("[", "![");
	} 
	
	public static java.sql.Date convertJavaDateToSqlDate(java.util.Date date) {
		//date contains the Java date
		//to convert it to a SQL date pass the date's milliseconds (from date.getTime())
		//as an argument to java.sql.Date
	    return new java.sql.Date(date.getTime());
	}
	
}
