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
public class GetUserDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetUserDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String userData;
		try
		{
			
			//String userName = session.getParameter("UserName");
		
			HttpSession session = request.getSession(true);
			session.getAttributeNames();
		//	System.out.println(session.getAttribute("*").toString());
			Object o = new Object();
			o = session.getAttribute("UserName");
			
			String userName =  o.toString();
			/*byte [] passwortDecoded =  Base64.decode(passwort);
			passwort = passwortDecoded.toString();*/
			DBAuslesen db = new DBAuslesen();
			
			userData = db.getUserData(userName);
			request.setAttribute("params", userData);	
			this.doNothing();
			
			//RequestDispatcher view = request.getRequestDispatcher("index.jsp");
			
			//view.forward(request, response);
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
	protected void doNothing(){
		
	}

}
