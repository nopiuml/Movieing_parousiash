package mainpackage;

import java.sql.*;

public class DatabaseConnection {

			  private static String url = "jdbc:mysql://127.0.0.1/imdb";
			  private static String driver = "com.mysql.jdbc.Driver";
			  private static String userName = "root"; 
			  private static String password = "afentikolap";
			  private static Connection con;
			  
			  public static Connection getConnection() {
				  try {
					  Class.forName(driver);
					  try {
						  con = DriverManager.getConnection(url, userName, password);
					  } catch (SQLException ex) {
						  // log an exception. fro example:
						  System.out.println("Failed to create the database connection."); 
					  	}
				 } catch (ClassNotFoundException ex) {
					 // log an exception. for example:
					 System.out.println("Driver not found."); 
				 }
				  return con;
}
}