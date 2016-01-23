package mainpackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;

public class MoviesRating {
	
	public MoviesRating(){
		super();
	}
	
	private Connection con = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	private static int[] avrg_rating = new int[10];
	private static double avrg_rate = 0;
	private static int count;
	private static int sum;

	
	public double Average_rating(String which_movie) {
		
		for(int i=0;i<avrg_rating.length;i++){
			
			avrg_rating[i] = 0;
		}
		
	    String sql = "SELECT ratings FROM ratings WHERE which_movie ='"+which_movie+"'";
		con = DatabaseConnection.getConnection();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			int i = 0;
			count = 0;
			sum = 0;
			while(rs.next()){
					
				avrg_rating[i] = rs.getInt("ratings");//αποθηκευω τις πληροφοριες απο το resultset στον πινακα movie_info
				sum = sum + avrg_rating[i];
				count = count + 1;
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		avrg_rate = (double)sum/count;
		DecimalFormat df = new DecimalFormat("#.##");      
		avrg_rate = Double.valueOf(df.format(avrg_rate));
				
		return avrg_rate;
	}
	
	public int num_of_raters(String which_movie) {
		
		for(int i=0;i<avrg_rating.length;i++){
			
			avrg_rating[i] = 0;
		}
		
	    String sql = "SELECT ratings FROM ratings WHERE which_movie ='"+which_movie+"'";
		con = DatabaseConnection.getConnection();
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			int i = 0;
			count = 0;
			while(rs.next()){
					
				avrg_rating[i] = rs.getInt("ratings");//αποθηκευω τις πληροφοριες απο το resultset στον πινακα movie_info
				count = count + 1;
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
				
		return count;
	}

}
