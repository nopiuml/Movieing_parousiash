package mainpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Admin extends RegisteredUser {

	public Admin(String username, String password){
		super(username,password);
	}
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private static String users[] = new String[20];
	private static String movies[] = new String[20];
	private static HomePage homepage = new HomePage();
	
	
	public String[] show_AllUploads(String username){
		
		movies = homepage.User_Uploads();
		return movies;
		
	}
	
	public String[] show_Users(String username) {
		
		for(int i=0;i<users.length;i++){
			
			users[i]= "";
		}
		
	    String sql = "SELECT username FROM Users";
		con = DatabaseConnection.getConnection();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			int i = 0;
			while(rs.next()){
					
				if (!(rs.getString("username").equals("admin"))){
					users[i] = rs.getString("username");
					i++;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;
	}

	
		public void Uploading_Admin(String username,String director,String description,String starring,String title,String link, String image){
		
		  
		  try {
			  
			  con = DatabaseConnection.getConnection();
			  PreparedStatement stmt = con.prepareStatement("INSERT INTO movie_info (username_uploader, director, description, starring, title, link, image) VALUES (?,?,?,?,?,?,?)");
			  
			  stmt.setString(1, username);
			  stmt.setString(2, director);
			  stmt.setString(3, description);
			  stmt.setString(4, starring);
			  stmt.setString(5, title);
			  stmt.setString(6, link);
			  stmt.setString(7, image);
			  stmt.executeUpdate();
		  
			  
	  } catch (Exception e) {
	  e.printStackTrace();
	  }
	}
		public void Deleting_user_upload(String link){
			
			try {
				  con = DatabaseConnection.getConnection();
				  PreparedStatement stmt = con.prepareStatement("DELETE FROM movie_info WHERE link ='"+link+"'");
				  stmt.executeUpdate();
				  			  
		  } catch (Exception e) {
		  e.printStackTrace();
		  }
		}
	
	public void Deleting_Users(String username){
		
		try {
			  con = DatabaseConnection.getConnection();
			  PreparedStatement stmt1 = con.prepareStatement("DELETE FROM Users WHERE username = '"+username+"'");
			  PreparedStatement stmt2 = con.prepareStatement("DELETE FROM movie_info WHERE username_uploader = '"+username+"'");
			  PreparedStatement stmt3 = con.prepareStatement("DELETE FROM ratings WHERE username_rating = '"+username+"'");
			  stmt1.executeUpdate();
			  stmt2.executeUpdate();
			  stmt3.executeUpdate();

			  			  
	  } catch (Exception e) {
	  e.printStackTrace();
	  }
	}
}
