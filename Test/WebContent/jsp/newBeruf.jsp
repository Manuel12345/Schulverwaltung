<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
//request.setCharacterEncoding("UTF-8");
String newBeruf=request.getParameter("newBeruf");
byte[] utf8bytes = newBeruf.getBytes("ISO-8859-1");
newBeruf = new String(utf8bytes);
		DBAuslesen db = new DBAuslesen();
		String stringGot = db.newBeruf(newBeruf);
		if(stringGot.equals("Fehler")){
			out.println("Fehler beim Anlegen");
		}
		else{
    		out.println("Der neue Ausbildungsberuf " + stringGot + " wurde angelegt.");
		}
%>