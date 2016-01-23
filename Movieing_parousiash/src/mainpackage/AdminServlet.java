package mainpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String redirect;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String[] movie_info = LoginServlet.admin.Viewing(username);
		String[] all_movies = LoginServlet.admin.show_AllUploads(username);
		String[] all_users = LoginServlet.admin.show_Users(username);
		String[] ratings = LoginServlet.admin.Viewing_ratings(username);
 		request.setAttribute("all_movies", all_movies);
 		request.setAttribute("all_users", all_users);
		request.setAttribute("movie",movie_info);
		request.setAttribute("username",username);
		request.setAttribute("ratings",ratings);
		redirect = "jsp/admin.jsp";
	
		RequestDispatcher rd = request.getRequestDispatcher(redirect);
		try {
			rd.forward(request, response);
		} catch (ServletException e) { e.printStackTrace(); }	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String upload_video = request.getParameter("upload_video");
		String delete_video = request.getParameter("delete_video");
		String delete_user = request.getParameter("delete_user");
		String delete_user_upload = request.getParameter("delete_user_upload");
		String rate_video = request.getParameter("rate");
		String delete_rating = request.getParameter("delete_rating");
		
		if (upload_video!=null){
			
			String director = request.getParameter("director");
			String description = request.getParameter("description");
			String starring = request.getParameter("starring");
			String title = request.getParameter("title");
			String link = request.getParameter("link");
			String image = request.getParameter("image");
			
			LoginServlet.admin.Uploading_Admin(LoginServlet.admin.getUsername(), director,description,starring,title,link, image);
			redirect = "jsp/upload_video.jsp";
		}
		
		if (delete_video!=null){
			
			String link = request.getParameter("delete_video");
			LoginServlet.admin.Deleting_upload(LoginServlet.admin.getUsername(), link.replace("https://www.youtube.com/embed/","https://www.youtube.com/watch?v="));
			
			redirect = "jsp/delete_video.jsp";
		}
		if (delete_user!=null){
			
			String user = request.getParameter("delete_user");
			LoginServlet.admin.Deleting_Users(user);
			
			redirect = "jsp/delete_user.jsp";
			
		}
		if (delete_user_upload!=null){
			
			String link = request.getParameter("delete_user_upload");
			LoginServlet.admin.Deleting_user_upload(link.replace("https://www.youtube.com/embed/","https://www.youtube.com/watch?v="));
			
			redirect = "jsp/delete_video.jsp"; 

		}
		if (rate_video != null){
			
			String image = request.getParameter("image");
			String rate = request.getParameter("rate");
			LoginServlet.admin.Rating(LoginServlet.admin.getUsername(), image , Integer.parseInt(rate));
		
			redirect = "jsp/rate_video.jsp";
		}
		
		if (delete_rating!= null){
			
			String which_movie = request.getParameter("delete_rating");
			LoginServlet.admin.Deleting_rating(LoginServlet.admin.getUsername(),which_movie);
		
			redirect = "jsp/delete_rating.jsp";
			
		}
		
		RequestDispatcher rd = request.getRequestDispatcher(redirect);
		try {
			rd.forward(request, response);
		} catch (ServletException e) { e.printStackTrace(); }	
	}

}
