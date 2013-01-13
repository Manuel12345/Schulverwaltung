package Controls;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import database.DBAuslesen;

/**
 * Servlet implementation class LoginServelet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		try
		{
			String userName = request.getParameter("UserName");
			String passwort = request.getParameter("Password");
			/*byte [] passwortDecoded =  Base64.decode(passwort);
			passwort = passwortDecoded.toString();*/
			DBAuslesen db = new DBAuslesen();
			ArrayList  liste = new ArrayList();
			liste = db.loginUser(userName, passwort);
			if(liste.size()!= 0){
				byte [] passwortDecoded =  Base64.decode(liste.get(0).toString());
				passwort = new String(passwortDecoded);
				String userData = db.getUserData(userName);
				request.setAttribute("pw", passwort);
				request.setAttribute("params", userData);			
			
			
				RequestDispatcher view = request.getRequestDispatcher("./jsp/sessionAction.jsp");
				view.forward(request, response);
			}
			else{
				RequestDispatcher view = request.getRequestDispatcher("login.html");
				view.forward(request, response);
			}
		
		}
		catch(Exception ex)
		{
			out.print(ex.getMessage());
		}
	}
    

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
