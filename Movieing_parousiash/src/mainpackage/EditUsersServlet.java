package mainpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditUsers
 */
@WebServlet("/EditUsersServlet")
public class EditUsersServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String redirect;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUsersServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String[] all_users = LoginServlet.admin.show_Users(username);
		request.setAttribute("username",username);
 		request.setAttribute("all_users", all_users);
		redirect = "jsp/EditUsers.jsp";

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
	}

}
