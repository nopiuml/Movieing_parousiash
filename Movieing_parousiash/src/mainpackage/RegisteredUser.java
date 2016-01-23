package mainpackage;

import java.sql.*;

public class RegisteredUser extends Users{
	

	public RegisteredUser(String username, String password){
		super(username, password);
	}

	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private static String[] movie_info = new String[10];
	private static String[] ratings = new String[10];
	private static int counter = 0;
	
	public String[] Viewing(String username) {
		
		for(int i=0;i<movie_info.length;i++){
			
			movie_info[i]= "";
		}
		
	    String sql = "SELECT link FROM movie_info WHERE username_uploader='"+username+"'";
		con = DatabaseConnection.getConnection();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			int i = 0;
			while(rs.next()){
					
				movie_info[i] = rs.getString("link");
				movie_info[i] = movie_info[i].replace("https://www.youtube.com/watch?v=","https://www.youtube.com/embed/");

				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return movie_info;
	}
	
	public String[] Viewing_ratings(String username){
		
		for(int i=0;i<ratings.length;i++){
					
					ratings[i]= "";
				}
				
			    String sql = "SELECT which_movie FROM ratings WHERE username_rating='"+username+"'";
				con = DatabaseConnection.getConnection();
				
				
				try {
					stmt = con.createStatement();
					rs = stmt.executeQuery(sql);
					
					int i = 0;
					while(rs.next()){
							
						ratings[i] = rs.getString("which_movie");
						i++;
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return ratings;
		
	}
	
		 
	public void Uploading(String username,String director,String description,String starring,String title,String link){
		
		  
		  try {
			  
			  con = DatabaseConnection.getConnection();
			  PreparedStatement stmt = con.prepareStatement("INSERT INTO movie_info (username_uploader, director, description, starring, title, link) VALUES (?,?,?,?,?,?)");
			  
			  stmt.setString(1, username);
			  stmt.setString(2, director);
			  stmt.setString(3, description);
			  stmt.setString(4, starring);
			  stmt.setString(5, title);
			  stmt.setString(6, link);
			  stmt.executeUpdate();
		  
			  
	  } catch (Exception e) {
	  e.printStackTrace();
	  }
	}
		  
	
	public void Rating(String username, String title, int rating){
		
		  
		  try {
			  con = DatabaseConnection.getConnection();
			  PreparedStatement stmt = con.prepareStatement("INSERT INTO ratings(username_rating, which_movie,ratings) VALUES (?,?,?)");
			  
			  stmt.setString(1, username);
			  stmt.setString(2, title);
			  stmt.setInt(3, rating);

			  stmt.executeUpdate();
		  
			  
	  } catch (Exception e) {
	  e.printStackTrace();
	  }
			  
	}
	
	public void Deleting_upload(String username, String link){
		
		try {
			  con = DatabaseConnection.getConnection();
			  PreparedStatement stmt = con.prepareStatement("DELETE FROM movie_info WHERE username_uploader = '"+username+"' AND link ='"+link+"'");
			  stmt.executeUpdate();
			  			  
	  } catch (Exception e) {
	  e.printStackTrace();
	  }
	}
		
		
			public void Deleting_rating(String username, String rating){
				
				try {
					  con = DatabaseConnection.getConnection();
					  PreparedStatement stmt = con.prepareStatement("DELETE FROM ratings WHERE username_rating = '"+username+"'"+"AND which_movie ='"+rating+"'");
					  stmt.executeUpdate();
					  			  
			  } catch (Exception e) {
			  e.printStackTrace();
			  }
				  
			
	}
}

