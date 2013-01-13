package Controls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.DBAuslesen;

/**
 * Servlet implementation class ChangeUserDataServlet
 */
public class ChangeUserDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeUserDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String userData;
		try
		{
		
			HttpSession session = request.getSession(true);
			session.getAttributeNames();
			Object o = new Object();
			o = session.getAttribute("UserName");	
			String userName =  o.toString();
			String newVorname = request.getParameter("vorname");
			String newNachname = request.getParameter("nachname");
			/*byte [] passwortDecoded =  Base64.decode(passwort);
			passwort = passwortDecoded.toString();*/
			DBAuslesen db = new DBAuslesen();
		
			db.writeUserData(userName, newVorname, newNachname);
			out.write("Ihre persoenlichen Angaben wurden geaendert. Die Aenderungen werden bei ihrem naechsten Login aktiv.");
			

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
