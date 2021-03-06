package Controls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;

import database.DBAuslesen;

/**
 * Servlet implementation class ControlServlet
 */
public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String ergebnis;
		try
		{
			String userName = request.getParameter("UserName");
			String passwort = request.getParameter("Password");
			String anrede = request.getParameter("anrede");
			String vorname = request.getParameter("vorname");
			String nachname = request.getParameter("nachname");
			if(passwort != "" && userName != "" && anrede != "Bitte auswaehlen..." && vorname != "" && nachname != ""){
				String passwortBase64Encoded =  Base64.encode(passwort.getBytes());
				DBAuslesen db = new DBAuslesen();
				ergebnis = db.registerNewUser(userName, passwortBase64Encoded, anrede, vorname, nachname);
			}
		    else{
		    	ergebnis = "Bitte füllen Sie alle Pflichtfelder aus! <a href='register.html'>LINK</a>";
		    }
		   
			request.setAttribute("ergebnis", ergebnis);
			RequestDispatcher view = request.getRequestDispatcher("/jsp/register.jsp");
			view.forward(request, response);
			
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
