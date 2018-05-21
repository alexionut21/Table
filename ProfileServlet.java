package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import licenta.Select;

@WebServlet("/Profile")
public class ProfileServlet extends HttpServlet{

	  /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ProfileServlet() {
      super();
      // TODO Auto-generated constructor stub
  }
	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("Profile servlet");
	String photo = (String) request.getParameter("photo");
	System.out.println(photo);
	String file=request.getServletContext().getRealPath(photo); 
	System.out.println(file);
	String file1=request.getPathInfo();
	System.out.println(file1);
	request.getRequestDispatcher("profile.jsp").forward(request, response);
    }


/**
 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
 */
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
}
}
