package database;

import java.util.*;
import java.sql.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;


public class DBAuslesen
{	
        // ==================== Hinweise ======================================================
	    // --------------------------  1. jdbc-connector -----------------------------------
	    // Achtung: der mysql-Connector muss unter WebContent/WEB-INF/lib gespeichert werden
		// (copy and paste) 
	    //dadurch erscheint er dann unter Projekt-Properties
		//  --> Libraries --> WebAppLibraries ... dorthin kann der Connector nicht(!!)
		//  über "add external jars" importiert werden
	    // 
		//	Bsp.: private String url="jdbc:mysql://localhost/schiffe,dbuser,dbpwd";
		//  Achtung: private String url="jdbc:mysql://localhost:3306/schiffe?user='root'&password=''";
		//           diese Zeile bedeutet: Passwort: YES aber leer !
        // ==================== Ende Hinweise ======================================================
		
	     // ===================================================================
	     //  ---------------- Daten zur Erstellung der DB-Verbindung ------------------- 
		private String dburl = "jdbc:mysql://localhost:3306/test?user='test'";
		private String dbdriver = "com.mysql.jdbc.Driver";
		private String dbuser = "root";
		private String dbpass = "";
	    // ===================================================================
		//  Deklaration von Objekten, die für das Lesen/Schreiben der DB erforderlich sind   
		    private Connection conn;
		    private Statement state;   
		 // ===========================================================================================   

	// ====================== Standard-Konstruktor (Anfang) ========================
			    
    public DBAuslesen()
    {
    }
    // ==================== Standard-Konstruktor (Ende) ======================    
 
    
    // =============Verbindung zur Datenbank herstellen (Anfang) =============    
    public void getConnection()
    {
    	try {    		
        	 		try {
        	 			Class.forName(dbdriver).newInstance();			
        	 			} 
        	 			catch (InstantiationException e) 
		        	     {
						  e.printStackTrace();
					      } 
		        	 	catch (IllegalAccessException e) 
		        	      {
						  e.printStackTrace();
					      }
            conn = DriverManager.getConnection(dburl);
            state = conn.createStatement();            
            } 
    	catch (ClassNotFoundException cnfe)
    	 	{
        	System.out.println("Klasse nicht gefunden");
            System.out.println(cnfe.toString());            
            } 
    	catch (SQLException ex){
            System.out.println(ex.toString());
            System.out.println(" SQL-Fehler ");        
        }
    }
    // =============Verbindung zur Datenbank herstellen (Ende) =============   
    
    // ==================== Datenbankverbindung schliessen (Anfang)  =======  
    public void closeConnection() 
    {
        try {
            conn.close();
	        } catch (Exception e) {
	            System.out.println(e.toString());
	        }
    }
    // ==================== Datenbankverbindung schliessen (Ende)  =======   
    
    // =================================================================================
    //        Methode zum Einlesen eines Datensatzes aus einer Datenbanktabelle (Anfang)
    // =================================================================================
    // Mit "zelle" wird eine "Bedingung" für einen zu suchenden Datensatz übergeben 
    // Bsp.:  Es wird die WKN-Nummer übergeben
    
    public ArrayList getDatensatz (String zelle) 
    {
        // ================================================
    	// wenn keine DB-Verbindung vorhanden, dann Verbindung öffnen:
    	if (conn == null) 
        {
            getConnection();
        }
    	// =========================================================================
        //  Der Datensatz aus der DB wird in eine "ArrayList" eingelesen
    	ArrayList  liste = new ArrayList();
    	// =========================================================================
    	// Die Übertragung des mySQL-Datensatzes erfolgt über eine ResultSet-Instanz
        // Deklaration:
    	ResultSet resultset;
        try
        {
         // =========================================================================
         // hier wird die SQL-DB-Abfrage für einen Datensatz gestartet: 
         // "executeQuery" beschreibt eine SQL-DB-Abfrage
         // Achtung: hier geht der Name der Tabelle ein, die ausgelesen
         // werden soll (hier: "zinstabelle")
         // =========================================================================
        	resultset = state.executeQuery(
                 "Select * from zinstabelle where WKN= '"+zelle+"'" );
         // Der Aufruf liefert uns die Ergebnisse als Zeilen in Form eines ResultSet-Objekts
         // Ergänzung: ganze Tabelle auslesen:   "Select * from zinstabelle" ;
         // =========================================================================	
         // Achtung: Eine Abarbeitung von aus der Datenbank ausgelesenen Werten ohne 
         //          geöffnete Datenbankverbindung ist über JDBC ResultSets nicht möglich  
        // Übertragung des Datensatzes in die "List"
            while (resultset.next())  
            	{
                // hier Datenbanktabelle mit 3 Spalten:
            	// die Liste enthält "String"-Objekte
            	liste.add(resultset.getString(1));
                liste.add(resultset.getString(2) );
                liste.add(resultset.getString(3) );
                }
            if (liste.isEmpty()) liste.add("Sorry, kein Datensatz verfügbar!");
        }         
        catch (SQLException ex)
        {
            System.out.println(ex.toString());
        }
        // wichtig: Am Ende DB-Verbindung wieder schließen
        if (conn != null) closeConnection();
        // Übergabe des Datensatzes an die aufrufende Methode
        return liste;
        //      =======================================================================
        // Hinweis: Bei mehreren Datensätzen kann jeder Datensatz in einer ArrayList al
        // abgespeichert werden und dieser wieder als Element einer zweiten ArrayList list
        //  Bsp.:  list.add(al);
        // Jedes Element von list ist damit ein Datensatz
        //      =======================================================================
       }
}
 
 

