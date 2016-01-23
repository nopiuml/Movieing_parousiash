package mainpackage;

import java.sql.*;

import javax.servlet.annotation.WebServlet;

public class RegisterValidation {
	private static String url = "jdbc:mysql://127.0.0.1/";
	private static String dbName = "imdb";
	private static String driver = "com.mysql.jdbc.Driver";
	private static String userName = "root";
	private static String passWord = "afentikolap";
	
		
		public static boolean checkUser(String username){
			 boolean st = false;
			 
			 try{
				 Class.forName(driver).newInstance();
				 Connection conn = DriverManager.getConnection(url+dbName,userName, passWord);
				 PreparedStatement ps = conn.prepareStatement("select * from Users where username=?");
				 ps.setString(1, username);
				 ResultSet rs = ps.executeQuery();
				 st = rs.next();
			 } catch (Exception e)
			 	{
				 	e.printStackTrace();
			 	}
			 
			 return st;
		}
	}