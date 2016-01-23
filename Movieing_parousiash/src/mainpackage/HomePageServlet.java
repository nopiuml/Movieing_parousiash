package mainpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/HomePageServlet")
public class HomePageServlet extends HttpServlet {
	

	private static final long serialVersionUID = 1L;
	private static String redirect;
	private static HomePage homepage = new HomePage();
	


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException{
		
		HttpSession session = request.getSession(true);
		
		String movies[] = homepage.User_Uploads();
		String uploaded_by[] = homepage.Uploaded_by();
		request.setAttribute("movies",movies);
		request.setAttribute("uploaded_by", uploaded_by);
		String username = request.getParameter("username");
		String logout = request.getParameter("logout");
		
		if (logout != null && logout.equalsIgnoreCase("true")){
			session.invalidate();
			session = request.getSession(true);
		}
		request.setAttribute("username", username);
		request.setAttribute("this_is_admin",session.getAttribute("this_is_admin"));
		request.setAttribute("logged_in",session.getAttribute("logged_in"));
		request.setAttribute("RegisterServlet",session.getAttribute("RegisterServlet"));

			RequestDispatcher rd = request.getRequestDispatcher("jsp/Homepage.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) { e.printStackTrace(); }	
				
	}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		
	}
}
