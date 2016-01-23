package mainpackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class HomePage {

	public HomePage(){
		super();
	}
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private static String[] movie_info = new String[20];
	private static String[] uploaded_by = new String[20];
	
	public String[] User_Uploads() {
		
		for(int i=0;i<movie_info.length;i++){
			
			movie_info[i]= "";
		}
		
	    String sql = "SELECT link FROM movie_info";
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
	

	public String[] Uploaded_by() {
		
		for(int i=0;i<movie_info.length;i++){
			
			movie_info[i]= "";
			uploaded_by[i] = "";
		}
		
	    String sql = "SELECT link,username_uploader FROM movie_info";
		con = DatabaseConnection.getConnection();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			int i = 0;
			while(rs.next()){
					
				movie_info[i] = rs.getString("link");
				movie_info[i] = movie_info[i].replace("https://www.youtube.com/watch?v=","https://www.youtube.com/embed/");
				uploaded_by[i] = rs.getString("username_uploader");
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return uploaded_by;
	}
	
	
	
}
