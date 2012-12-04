package Controls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.ZinsberechnungsBean;

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
		try
		{
			double anfangsKapital = Double.parseDouble(request.getParameter("Kapital"));
			double zinsSatz = Double.parseDouble(request.getParameter("Zinsen"));
			double laufzeit = Double.parseDouble(request.getParameter("Jahre"));
		//	double endbetrag = 0;
			ZinsberechnungsBean zb = new ZinsberechnungsBean().
										setAnfangskapital(anfangsKapital).
										setLaufzeit(laufzeit).
										setZinssatz(zinsSatz);
			double endbetrag =  (Math.round(zb.get_endKapital()) * 100) / 100.0;
			request.setAttribute("Anfangsbetrag", anfangsKapital);
			request.setAttribute("Zins", zinsSatz);
			request.setAttribute("Laufdauer", laufzeit);
			request.setAttribute("Ergebnis", endbetrag);
			RequestDispatcher view = request.getRequestDispatcher("Ergebnis.jsp");
			view.forward(request, response);
			//out.print("Endbetrag: " + endbetrag + " Û");
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
