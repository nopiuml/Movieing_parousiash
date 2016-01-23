package mainpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet(name = "RegisterServlet", urlPatterns = { "/RegisterServlet" })
public class RegisterServlet extends HttpServlet {
	private static String url = "jdbc:mysql://127.0.0.1/";
	private static String dbName = "imdb";
	private static String driver = "com.mysql.jdbc.Driver";
	private static String userName = "root";
	private static String password = "afentikolap";
	private static final long serialVersionUID = 1L;
	public static RegisteredUser registeredUser; 
	public static HomePage homepage = new HomePage();
	private static String registered;
	private static String redirect;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("jsp/Register.jsp");
		try {
			rd.forward(request, response);
		} catch (ServletException e) { e.printStackTrace(); }	
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				String usernameGiven = request.getParameter("username");
				String passwordGiven = request.getParameter("password");
				String repassGiven = request.getParameter("repass");
				HttpSession session = request.getSession(true);
				
				if(!RegisterValidation.checkUser(usernameGiven)){
					
					if (passwordGiven.equalsIgnoreCase(repassGiven)){
					Connection conn;
						
					
						
						try{
							
							Class.forName(driver).newInstance();
							conn = DriverManager.getConnection(url+dbName,userName,password);
							PreparedStatement ps = conn.prepareStatement("insert into Users values(?,?)");
							
							ps.setString(1, usernameGiven);
							ps.setString(2, passwordGiven);
							int i = ps.executeUpdate();
							
							if(i>0){
								registered = "true";
							}
							
							
							
						}
						
						catch (Exception e) {
							e.printStackTrace();
						}
					registeredUser = new RegisteredUser(usernameGiven,passwordGiven);
					String movies[] = homepage.User_Uploads();
					String uploaded_by[] = homepage.Uploaded_by();
					request.setAttribute("movies",movies);
					request.setAttribute("uploaded_by", uploaded_by);
					request.setAttribute("username", usernameGiven);
					request.setAttribute("RegisterServlet",registered);
					request.setAttribute("registered",registered);
					session.setAttribute("RegisterServlet",registered);
					session.setAttribute("username",usernameGiven);
					redirect = "jsp/Homepage.jsp";	
					
					}
					
					else{
						request.setAttribute("username",usernameGiven);
						request.setAttribute("password",passwordGiven);
						request.setAttribute("repass",repassGiven);
						redirect = "jsp/registererr_password.jsp";
						}
					
				}
					
					
				else{
					request.setAttribute("username",usernameGiven);
					request.setAttribute("password",passwordGiven);
					request.setAttribute("repass",repassGiven);
					redirect = "jsp/registererr_username.jsp";
				}
					
				RequestDispatcher rd = request.getRequestDispatcher(redirect);
				try {
						rd.forward(request, response);
				} catch (ServletException e) { e.printStackTrace(); }	
		
					
			}	

}

