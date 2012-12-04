package Controls;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.SessionEvent;

import java.util.*;

/**
 * Servlet implementation class LoginServlet
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

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		boolean erfolgreich = false;
		String loginname = request.getParameter("loginname");
		String passw = request.getParameter("passwort");
		
		//Ich darf mich einloggen
		String loginnameDarf = "sgeil";
		String passwortDarf = "test123";
		
		// Passwortcheck
		
		erfolgreich = (loginname.equals(loginnameDarf))?(passw.equals(passwortDarf))?true:false:false;
		request.setAttribute("Ergebnis", erfolgreich);
		RequestDispatcher view = request.getRequestDispatcher("login.jsp");
		view.forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}

}
