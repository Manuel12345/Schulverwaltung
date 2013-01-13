<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryString");
byte[] utf8bytes4 = str.getBytes("ISO-8859-1");
str = new String(utf8bytes4);
		DBAuslesen db = new DBAuslesen();
		String fachGot = db.newFach(str);
		if(!fachGot.equals("Fehler")){
    		out.println("Das neue Fach " + fachGot + " wurde angelegt.");
		}
		else{
			out.println("Fehler beim Anlegen.");	
		}
%>