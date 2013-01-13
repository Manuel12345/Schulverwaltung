<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryStringOne");
String lehrerToFach = request.getParameter("queryStringTwo");
byte[] utf8bytes5 = str.getBytes("ISO-8859-1");
str = new String(utf8bytes5);
byte[] utf8bytes = lehrerToFach.getBytes("ISO-8859-1");
lehrerToFach = new String(utf8bytes);
		DBAuslesen db = new DBAuslesen();
		String stringGot = db.newLeher(str, lehrerToFach);

		if(stringGot.equals("Fehler")){
			out.println("Fehler beim Anlegen");
		}
		else{
    		out.println("Die neue Lehrkraft " + stringGot + " wurde angelegt.");
		}
%>