package mainpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditYourUploadServlet
 */
@WebServlet("/EditYourUploadServlet")
public class EditYourUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditYourUploadServlet() {
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
			String[] movie_info = LoginServlet.admin.Viewing(LoginServlet.admin.getUsername());
			request.setAttribute("movie",movie_info);
		}
		
		if (userAccount_log!=null){
			
			request.setAttribute("username", username);
			request.setAttribute("userAccount_log", userAccount_log);
			String[] movie_info = LoginServlet.registeredUser.Viewing(LoginServlet.registeredUser.getUsername());
			request.setAttribute("movie",movie_info);
			
		}
		if (userAccount_reg!=null){
			request.setAttribute("username", username);
			request.setAttribute("userAccount_reg", userAccount_reg);
			String[] movie_info = RegisterServlet.registeredUser.Viewing(RegisterServlet.registeredUser.getUsername());
			request.setAttribute("movie",movie_info);
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("jsp/EditYourUpload.jsp");
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
