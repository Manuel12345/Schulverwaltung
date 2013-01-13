<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String newBetrieb=request.getParameter("newBetrieb");
String newAusbilder=request.getParameter("newAusbilder");
String newEmail=request.getParameter("newEmail");
String newAdresse=request.getParameter("newAdresse");
byte[] utf8bytes = newBetrieb.getBytes("ISO-8859-1");
newBetrieb = new String(utf8bytes);
byte[] utf8bytes2 = newAusbilder.getBytes("ISO-8859-1");
newAusbilder = new String(utf8bytes2);
byte[] utf8bytes3 = newEmail.getBytes("ISO-8859-1");
newEmail = new String(utf8bytes3);
byte[] utf8bytes4 = newAdresse.getBytes("ISO-8859-1");
newAdresse = new String(utf8bytes4);

		DBAuslesen db = new DBAuslesen();
		String stringGot = db.newBetrieb(newBetrieb, newAusbilder, newEmail, newAdresse);

		if(stringGot.equals("Fehler")){
			out.println("Fehler beim Anlegen");
		}
		else{
    		out.println("Der neue Betrieb " + stringGot + " wurde angelegt.");
		}
%>