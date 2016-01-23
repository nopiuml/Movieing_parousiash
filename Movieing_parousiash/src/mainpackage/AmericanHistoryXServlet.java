package mainpackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MoviePageServlet
 */
@WebServlet("/AmericanHistoryXServlet")
public class AmericanHistoryXServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String redirect;
	private static Admin admin;
	private static MoviesRating avrg = new MoviesRating();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AmericanHistoryXServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String log = request.getParameter("log");
		String reg = request.getParameter("reg");
		String username = request.getParameter("username");
		String image = request.getParameter("image");
		double avrg_rating = avrg.Average_rating(image);
		String avrg_rating_s = Double.toString(avrg_rating);
		request.setAttribute("avrg_rating", avrg_rating_s);
		request.setAttribute("username",username);
		request.setAttribute("image",image);
		request.setAttribute("log", log);
		request.setAttribute("reg", reg);

		redirect = "jsp/AmericanHistoryX.jsp";
		
		int count = avrg.num_of_raters(image);
		String count_s = Integer.toString(count);
		request.setAttribute("count", count_s);
		
		
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
