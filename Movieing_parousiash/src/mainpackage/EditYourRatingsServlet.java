package mainpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditYourRatings
 */
@WebServlet("/EditYourRatingsServlet")
public class EditYourRatingsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditYourRatingsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String username = request.getParameter("username");
		String userAccount_log = request.getParameter("userAccount_log"); 
		String userAccount_reg = request.getParameter("userAccount_reg");
		
		if (username.equals("admin")){
			request.setAttribute("username",username);
			String[] ratings = LoginServlet.admin.Viewing_ratings(LoginServlet.admin.getUsername());
			request.setAttribute("ratings",ratings);
		}
		
		if (userAccount_log!=null){
			
			request.setAttribute("username", username);
			request.setAttribute("userAccount_log", userAccount_log);
			String[] ratings = LoginServlet.registeredUser.Viewing_ratings(LoginServlet.registeredUser.getUsername());
			request.setAttribute("ratings",ratings);
			
		}
		if (userAccount_reg!=null){
			request.setAttribute("username", username);
			request.setAttribute("userAccount_reg", userAccount_reg);
			String[] ratings = RegisterServlet.registeredUser.Viewing_ratings(RegisterServlet.registeredUser.getUsername());
			request.setAttribute("ratings",ratings);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("jsp/EditYourRatings.jsp");
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
