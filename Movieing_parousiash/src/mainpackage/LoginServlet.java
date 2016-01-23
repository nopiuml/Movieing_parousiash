package mainpackage;

import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")


public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	private static String redirect;
	public static  RegisteredUser registeredUser; 
	public static Admin admin;
	private static String logged_in;
	private static String this_is_admin;
	public static HomePage homepage = new HomePage();

	/* @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
	super();
	 //TODO Auto-generated constructor stub
	}
	

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	 public void doGet(HttpServletRequest request, HttpServletResponse response)throws IOException{

	 RequestDispatcher rd = request.getRequestDispatcher("jsp/login.jsp");
	 try {
	  rd.forward(request, response);
	 } catch (ServletException e) { e.printStackTrace(); }  


	}



	


	//@see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// edw pairnoume to onoma tou user apo th forma
		String usernameGiven = request.getParameter("user_name");
		String passwordGiven = request.getParameter("pass_word"); 
		
		HttpSession session = request.getSession(true);

		if (LoginVerification.checkUser(usernameGiven, passwordGiven)){

			
			String movies[] = homepage.User_Uploads();
			String uploaded_by[] = homepage.Uploaded_by();
			request.setAttribute("movies",movies);
			request.setAttribute("uploaded_by", uploaded_by);
			// an einai o admin mpainei sth selida tou ws admin
			if (usernameGiven.equalsIgnoreCase("admin")){
					
				this_is_admin = "true";
				request.setAttribute("this_is_admin",this_is_admin);
				admin = new Admin(usernameGiven,passwordGiven);
				request.setAttribute("username",usernameGiven);
				redirect = "jsp/Homepage.jsp";
				session.setAttribute("this_is_admin", this_is_admin);
			}
			else
			{
				logged_in = "true";
				request.setAttribute("logged_in",logged_in);
				registeredUser = new RegisteredUser(usernameGiven,passwordGiven);
				request.setAttribute("username", usernameGiven);
				redirect = "jsp/Homepage.jsp";
				session.setAttribute("logged_in", logged_in);

			}
			session.setAttribute("username", usernameGiven);

		}
		else 
		{
			request.setAttribute("username",usernameGiven);
			redirect = "jsp/logginerr.jsp";
		}

		RequestDispatcher rd = request.getRequestDispatcher(redirect);
		try {
			rd.forward(request, response);
		} catch (ServletException e) { e.printStackTrace(); }
		//Î±Î½Î¿Î¹Î³Î¿Ï…Î¼Îµ ÏƒÏ…Î½Î´ÎµÏƒÎ· Î¼Îµ Ï„Î· Î²Î±ÏƒÎ· Î´ÎµÎ´Î¿Î¼ÎµÎ½Ï‰Î½
	}
}
