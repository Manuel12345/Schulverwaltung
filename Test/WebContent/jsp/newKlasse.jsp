<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryStringOne");
String lehrerToK = request.getParameter("queryStringTwo");
byte[] utf8bytes4 = str.getBytes("ISO-8859-1");
str = new String(utf8bytes4);
byte[] utf8bytes5 = lehrerToK.getBytes("ISO-8859-1");
lehrerToK = new String(utf8bytes5);
		DBAuslesen db = new DBAuslesen();
		String stringGot = db.newKlasse(str, lehrerToK);

		if(stringGot.equals("Fehler")){
			out.println("Fehler beim Anlegen");
		}
		else{
			String [] al = stringGot.split(";");
			String vorname = al[0];
			String nachname = al[1];
			String klasse = al[2];
    		out.println("Die neue Klasse " + klasse + " mit der Lehrkraft " + vorname + nachname + " wurde angelegt.");
		}
%>