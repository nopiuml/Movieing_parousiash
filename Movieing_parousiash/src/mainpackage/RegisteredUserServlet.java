package mainpackage;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * @author eugenia
 *
 */
@WebServlet("/RegisteredUserServlet")

public class RegisteredUserServlet extends HttpServlet{
	
	private static String redirect;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException{
		
		String userAccount_log = request.getParameter("userAccount_log");
		String userAccount_reg = request.getParameter("userAccount_reg");

		HttpSession session = request.getSession(true);
		
		if (userAccount_reg != null){
			String username_reg = request.getParameter("username_reg");
			String[] movie_info = RegisterServlet.registeredUser.Viewing(RegisterServlet.registeredUser.getUsername());
			request.setAttribute("movie",movie_info);
			String[] ratings = RegisterServlet.registeredUser.Viewing_ratings(RegisterServlet.registeredUser.getUsername());
			request.setAttribute("ratings",ratings);
			request.setAttribute("username",username_reg);
			request.setAttribute("userAccount_reg", userAccount_reg);
			session.setAttribute("RegisterServlet", "true");
			redirect = "jsp/user.jsp";
			
		}
		if (userAccount_log != null){
			String username_log = request.getParameter("username_log");
			String[] movie_info = LoginServlet.registeredUser.Viewing(LoginServlet.registeredUser.getUsername());
			request.setAttribute("movie",movie_info);
			String[] ratings = LoginServlet.registeredUser.Viewing_ratings(LoginServlet.registeredUser.getUsername());
			request.setAttribute("ratings",ratings);
			request.setAttribute("username",username_log);
			request.setAttribute("userAccount_log", userAccount_log);
			redirect = "jsp/user.jsp";
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(redirect);
				try {
					rd.forward(request, response);
				} catch (ServletException e) { e.printStackTrace(); }	
				
			}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
				
		String upload_video = request.getParameter("upload_video");
		String upload_video_reg = request.getParameter("upload_video_reg");
		String delete_video = request.getParameter("delete_video");
		String delete_video_reg = request.getParameter("delete_video_reg");
		String rate_video_reg = request.getParameter("rate_reg");
		String rate_video_log = request.getParameter("rate_log");
		String delete_rating_log = request.getParameter("delete_rating_log");
		String delete_rating_reg = request.getParameter("delete_rating_reg");
		
		if (upload_video_reg!=null){
			
 			String director = request.getParameter("director");
			String description = request.getParameter("description");
			String starring = request.getParameter("starring");
			String title = request.getParameter("title");
			String link = request.getParameter("link");
			
			RegisterServlet.registeredUser.Uploading(RegisterServlet.registeredUser.getUsername(), director,description,starring,title,link);
			redirect = "jsp/upload_video.jsp";
		}
		if (upload_video!=null){
			
			String director = request.getParameter("director");
			String description = request.getParameter("description");
			String starring = request.getParameter("starring");
			String title = request.getParameter("title");
			String link = request.getParameter("link");
			
			LoginServlet.registeredUser.Uploading(LoginServlet.registeredUser.getUsername(), director,description,starring,title,link);
			redirect = "jsp/upload_video.jsp";
		}
		if (delete_video_reg!=null){
			
			String link = request.getParameter("delete_video_reg");
			RegisterServlet.registeredUser.Deleting_upload(RegisterServlet.registeredUser.getUsername(),link.replace("https://www.youtube.com/embed/","https://www.youtube.com/watch?v="));
			
			redirect = "jsp/delete_video.jsp";
		}	
		if (delete_video!=null){
			
			String link = request.getParameter("delete_video");
			LoginServlet.registeredUser.Deleting_upload(LoginServlet.registeredUser.getUsername(), link.replace("https://www.youtube.com/embed/","https://www.youtube.com/watch?v="));
			
			redirect = "jsp/delete_video.jsp";
		}
		if (rate_video_log!=null){
			
			String image = request.getParameter("image");
			String rate = request.getParameter("rate_log");
			LoginServlet.registeredUser.Rating(LoginServlet.registeredUser.getUsername(), image , Integer.parseInt(rate));
		
			redirect = "jsp/rate_video.jsp";
		}
		if (rate_video_reg!=null){
			
			String image = request.getParameter("image");
			String rate = request.getParameter("rate_reg");
			RegisterServlet.registeredUser.Rating(RegisterServlet.registeredUser.getUsername(), image , Integer.parseInt(rate));
		
			redirect = "jsp/rate_video.jsp";
		}
		if (delete_rating_reg!=null){
			
			String which_movie = request.getParameter("delete_rating_reg");
			RegisterServlet.registeredUser.Deleting_rating(RegisterServlet.registeredUser.getUsername(),which_movie);
			
			redirect = "jsp/delete_rating.jsp";

		}
		
		if (delete_rating_log!=null){
			
			String which_movie = request.getParameter("delete_rating_log");
			LoginServlet.registeredUser.Deleting_rating(LoginServlet.registeredUser.getUsername(),which_movie);
		
			redirect = "jsp/delete_rating.jsp";
			


		}

		RequestDispatcher rd = request.getRequestDispatcher(redirect);
		try {
			rd.forward(request, response);
		} catch (ServletException e) { e.printStackTrace(); }	
		
		
		

	}
}
