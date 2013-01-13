package database;

import java.util.*;
import java.io.InputStream;
import java.io.Reader;
import java.math.BigDecimal;
import java.net.URL;
import java.sql.*;
import java.sql.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;


public class DBAuslesen
{	
        // ==================== Hinweise ======================================================
	    // --------------------------  1. jdbc-connector -----------------------------------
	    // Achtung: der mysql-Connector muss unter WebContent/WEB-INF/lib gespeichert werden
		// (copy and paste) 
	    //dadurch erscheint er dann unter Projekt-Properties
		//  --> Libraries --> WebAppLibraries ... dorthin kann der Connector nicht(!!)
		//  �ber "add external jars" importiert werden
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
		//  Deklaration von Objekten, die f�r das Lesen/Schreiben der DB erforderlich sind   
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
    // Mit "zelle" wird eine "Bedingung" f�r einen zu suchenden Datensatz �bergeben 
    // Bsp.:  Es wird die WKN-Nummer �bergeben
    
    public ArrayList getDatensatz (String zelle) 
    {
        // ================================================
    	// wenn keine DB-Verbindung vorhanden, dann Verbindung �ffnen:
    	if (conn == null) 
        {
            getConnection();
        }
    	// =========================================================================
        //  Der Datensatz aus der DB wird in eine "ArrayList" eingelesen
    	ArrayList  liste = new ArrayList();
    	// =========================================================================
    	// Die �bertragung des mySQL-Datensatzes erfolgt �ber eine ResultSet-Instanz
        // Deklaration:
    	ResultSet resultset;
        try
        {
         // =========================================================================
         // hier wird die SQL-DB-Abfrage f�r einen Datensatz gestartet: 
         // "executeQuery" beschreibt eine SQL-DB-Abfrage
         // Achtung: hier geht der Name der Tabelle ein, die ausgelesen
         // werden soll (hier: "zinstabelle")
         // =========================================================================
        	resultset = state.executeQuery(
                 "Select * from zinstabelle where WKN= '"+zelle+"'" );
         // Der Aufruf liefert uns die Ergebnisse als Zeilen in Form eines ResultSet-Objekts
         // Erg�nzung: ganze Tabelle auslesen:   "Select * from zinstabelle" ;
         // =========================================================================	
         // Achtung: Eine Abarbeitung von aus der Datenbank ausgelesenen Werten ohne 
         //          ge�ffnete Datenbankverbindung ist �ber JDBC ResultSets nicht m�glich  
        // �bertragung des Datensatzes in die "List"
            while (resultset.next())  
            	{
                // hier Datenbanktabelle mit 3 Spalten:
            	// die Liste enth�lt "String"-Objekte
            	liste.add(resultset.getString(1));
                liste.add(resultset.getString(2) );
                liste.add(resultset.getString(3) );
                }
            if (liste.isEmpty()) liste.add("Sorry, kein Datensatz verf�gbar!");
        }         
        catch (SQLException ex)
        {
            System.out.println(ex.toString());
        }
        // wichtig: Am Ende DB-Verbindung wieder schlie�en
        if (conn != null) closeConnection();
        // �bergabe des Datensatzes an die aufrufende Methode
        return liste;
        //      =======================================================================
        // Hinweis: Bei mehreren Datens�tzen kann jeder Datensatz in einer ArrayList al
        // abgespeichert werden und dieser wieder als Element einer zweiten ArrayList list
        //  Bsp.:  list.add(al);
        // Jedes Element von list ist damit ein Datensatz
        //      =======================================================================
       }
    public String registerNewUser(String name, String passwort, String anrede, String vorname, String nachname) throws SQLException{
        Statement stmt;
        String message ="";
    	if (conn == null) 
        {
            getConnection();
        }
    	ArrayList liste = new ArrayList();
    	ResultSet resultset;
    	boolean anlegen = true;
    	try{
    		// Kontrolle ob User nicht bereits vorhanden
    		resultset = state.executeQuery( "Select * from users where name_= '"+name+"'" );
    		
    		while (resultset.next()){
              	liste.add(resultset.getString(2).toString());     	
             }
    		for (Object username : liste) {
				if(username.toString().equals(name)){
					anlegen=false;
				}
			}
    		//User Anlegen
    		if(anlegen == true){
    			try {
    				stmt = conn.createStatement();
    			 	String sqlOrder = "INSERT INTO users (name_, passwort_, anrede_, vorname_, nachname_) VALUES ('"+name+"', '"+passwort+"', '"+anrede+"', '"+vorname+"', '"+nachname+"')";
    			 	stmt.executeUpdate(sqlOrder);
    			 	stmt.close();
    			 	conn.close();
    			 	message = "Herzlich willkommen " + name + ". Sie können sich nun <a href = 'login.html'>einloggen</a>";
    		 	} catch ( SQLException e ) {
    		 		// TODO Auto-generated catch block
    		 		message = "Fehler beim Anlegen";
    		 		System.out.println(e);
    		 		return message;
    		 	}
    		}
    		else{
    			message = "User bereits vorhanden";
    		}
    		
    	}
    	catch(SQLException e){
    		message = "Fehler beim Anlegen";
	 		System.out.println(e);
	 		return message;
    	}
		return message;

    }
    public ArrayList loginUser(String name, String passwort) throws SQLException{
        //	String passwortBase64Encoded =  Base64.encode(passwort.getBytes());
            Statement stmt;
            ArrayList  liste = new ArrayList();
        	if (conn == null) 
            {
                getConnection();
            }
        	ResultSet resultset;
            try
            {
             
            	resultset = state.executeQuery(
                     "Select * from users where name_= '"+name+"'" );
            	
            	 while (resultset.next())  
             	{
               
                 	liste.add(resultset.getString(3).toString());
                 	//liste.add(resultset.getString(3) );
                 	
                 }
            
            }
            catch (SQLException ex)
            {
                System.out.println(ex.toString());
            }
            // �bergabe des Datensatzes an die aufrufende Methode
            return liste;
        }
    public String getUserData(String usrNameGot){
		String liste = "";
		if (conn == null) 
        {
            getConnection();
        }
    	ResultSet resultset;
        try
        {
         
        	resultset = state.executeQuery(
                 "Select * from users where name_= '"+usrNameGot+"'" );
        	
        	 while (resultset.next())  
         	{
           
             	liste += resultset.getString(2).toString() + ";";
             	liste += resultset.getString(3).toString() + ";";
             	liste += resultset.getString(4).toString() + ";";
             	liste += resultset.getString(5).toString() + ";";
             	liste += resultset.getString(6).toString() + ";";    	
             }
        
        }
        catch (SQLException ex)
        {
            System.out.println(ex.toString());
        }
              
        return liste;
	}
    
    public void writeUserData(String userName, String newVorname, String newNachname){
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	try {
			stmt = conn.createStatement();
		 	String sqlOrder = "update users set vorname_ = '"+newVorname+"', nachname_ = '"+newNachname+"' where name_= '"+userName+"'";
		 	stmt.executeUpdate(sqlOrder);
		 	stmt.close();
		 	conn.close();
		} catch ( SQLException e ) {
	 		// TODO Auto-generated catch block	
	 		System.out.println(e);
	 		return;
	 	}
    }
    // *** SearchFunctions 4 Autocomplete Functions ***//
    public ResultSet searchSchueler(String schueler){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT vorname_, nachname_ FROM users WHERE nachname_ LIKE '"+schueler+"%' OR vorname_ Like '"+schueler+"%' LIMIT 20";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;
    }
    
    public ResultSet searchVorbildung(){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT vorbildung_ FROM vorbildung";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;
    }
    
    public ResultSet searchLehrer(String lehrerGot){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT vorname_, nachname_ FROM lehrer WHERE nachname_ LIKE '"+lehrerGot+"%' OR vorname_ Like '"+lehrerGot+"%' LIMIT 20";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;
    }
    
    public ResultSet searchBetrieb(String strGot){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT betrieb_, adresse_, ausbilder_, ausbilderEmail_ FROM ausbilder WHERE betrieb_ LIKE '%"+strGot+"%' LIMIT 20";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;
    }
    public ResultSet searchKlasse (String strGot){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT name_, vorname_, nachname_ FROM klasse k, lehrer l where k.idlehrer_ = l.idlehrer_ and name_ like '%"+strGot+"%'";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;
    }
    
    public ResultSet searchFach(){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT idfach_, fach_ FROM fach LIMIT 20";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;	
    }
    
    public ResultSet searchBeruf(String strGot){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT beruf_ FROM beruf where beruf_ like '%"+strGot+"%' LIMIT 20";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;	
    }
    
    public ResultSet searchKonfession(String strGot){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT kuerzel_, name_ FROM konfession where name_ like '%"+strGot+"%' LIMIT 20";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;	
    }
 //
 //*** Neue Daten erfassen  ***//
    public String newLeher(String lehrer, String lehrer2Fach){
    	if (conn == null) 
        {
            getConnection();
        }
    	String [] al = lehrer.split(";");
		String vorname = al[0];
		String nachname = al[1];
		Statement stmt;
    	try {
			stmt = conn.createStatement();
			String sqlOrder = "INSERT INTO lehrer (vorname_, nachname_) VALUES ('"+vorname+"', '"+nachname+"')";
		 	stmt.executeUpdate(sqlOrder);
		 	stmt.close();
		} catch ( SQLException e ) {
	 		// TODO Auto-generated catch block	
	 		System.out.println(e);
	 		return "Fehler";
	 	}
    	String [] allFach = lehrer2Fach.split(",");
         
		try {
			for(int x=0;x<allFach.length;x++){
				stmt = conn.createStatement();
				String sqlInsert = "insert into fach2lehrer (idfach_, idlehrer_) values ("+ allFach[x] +", (select lehrer.idlehrer_ from lehrer where vorname_ ='"+vorname+"' and nachname_ = '"+nachname+"'))";

				stmt.executeUpdate(sqlInsert);
	    	}
			stmt.close();
			conn.close();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return vorname + ";" + nachname;
    }
    
    public String newKlasse(String klasseGot, String lehrerGot){
    	if (conn == null) 
        {
            getConnection();
        }
    	String [] al = lehrerGot.split(",");
		String vorname = al[0];
		String nachname = al[1].substring(1);
		Statement stmt;
    	try {
			stmt = conn.createStatement();
			String sqlOrder = "insert into klasse (name_, idlehrer_) values ('"+ klasseGot +"', (select lehrer.idlehrer_ from lehrer where vorname_ ='"+vorname+"' and nachname_ = '"+nachname+"'))";
		 	stmt.executeUpdate(sqlOrder);
		 	String sqlOrder2 ="insert into gruppe (bezeichnung_, idklasse_) values('A', (select klasse.idklasse_ from klasse where name_ ='"+klasseGot+"' ))";
		 	stmt.executeUpdate(sqlOrder2);
		 	String sqlOrder3 ="insert into gruppe (bezeichnung_, idklasse_) values('B', (select klasse.idklasse_ from klasse where name_ ='"+klasseGot+"' ))";
		 	stmt.executeUpdate(sqlOrder3);
		 	stmt.close();
		 	conn.close();	
		} catch ( SQLException e ) {
	 		// TODO Auto-generated catch block	
	 		System.out.println(e);
	 		return "Fehler";
	 	}
    	return vorname + ";" + nachname + ";" + klasseGot;
    }
    
    public String newFach(String fachGot){
    	if (conn == null) 
        {
            getConnection();
        }
		Statement stmt;
    	try {
			stmt = conn.createStatement();
			String sqlOrder = "INSERT INTO fach (fach_) VALUES ('"+fachGot+"')";
		 	stmt.executeUpdate(sqlOrder);
		 	stmt.close();
		 	conn.close();
		} catch ( SQLException e ) {
	 		// TODO Auto-generated catch block	
	 		System.out.println(e);
	 		return "Fehler";
	 	}
    	return fachGot;
    }
    
    public String newBeruf(String berufGot){
    	if (conn == null) 
        {
            getConnection();
        }
		Statement stmt;
    	try {
			stmt = conn.createStatement();
			String sqlOrder = "INSERT INTO beruf (beruf_) VALUES ('"+berufGot+"')";
		 	stmt.executeUpdate(sqlOrder);
		 	stmt.close();
		 	conn.close();
		} catch ( SQLException e ) {
	 		// TODO Auto-generated catch block	
	 		System.out.println(e);
	 		return "Fehler";
	 	}
    	return berufGot;
    }
    
    public String newBetrieb(String newBetrieb, String newAusbilder, String newEmail, String newAdresse){
    	if (conn == null) 
        {
            getConnection();
        }
		Statement stmt;
    	try {
			stmt = conn.createStatement();
			String sqlOrder = "INSERT INTO ausbilder (betrieb_, adresse_, ausbilder_, ausbilderEmail_) VALUES ('"+newBetrieb+"', '"+newAdresse+"', '"+newAusbilder+"', '"+newEmail+"')";
		 	stmt.executeUpdate(sqlOrder);
		 	stmt.close();
		 	conn.close();
		} catch ( SQLException e ) {
	 		// TODO Auto-generated catch block	
	 		System.out.println(e);
	 		return "Fehler";
	 	}
    	return newBetrieb;
    }
    
    public ResultSet showBetrieb(){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT betrieb_, adresse_, ausbilder_, ausbilderEmail_ FROM ausbilder";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;
    }
    
    public ResultSet showFach(){
    	ResultSet rs = null;
    	if (conn == null) 
        {
            getConnection();
        }
    	Statement stmt;
    	String sql = "SELECT fach_ FROM fach";
		try {
			stmt = conn.createStatement();
			stmt.executeQuery(sql);
			rs= stmt.getResultSet();	
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 	
    	return rs;
    }
    
    
    public ResultSet showKlasse(){
    ResultSet rs = null;
    if (conn == null) 
    {
        getConnection();
    }
	Statement stmt;
	String sql = "SELECT name_, vorname_, nachname_ FROM klasse k, lehrer l where k.idlehrer_ = l.idlehrer_";
	try {
		stmt = conn.createStatement();
		stmt.executeQuery(sql);
		rs= stmt.getResultSet();	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} 	
    return rs;
    }
   
}


 
 

