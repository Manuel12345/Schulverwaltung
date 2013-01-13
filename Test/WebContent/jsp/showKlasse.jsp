<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryString");
		DBAuslesen db = new DBAuslesen();
		ResultSet rs = db.showKlasse();
		int count = 1;
		while (rs.next ()){
			out.println("<tr><td>"+count+". </td><td>"+rs.getString("name_")+"</td><td>"+rs.getString("vorname_")+ " " + rs.getString("nachname_")+"</td></tr>");
			count++;
		}
%>
