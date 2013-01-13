<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
String str=request.getParameter("queryString");
		DBAuslesen db = new DBAuslesen();
		ResultSet rs = db.showFach();
		int count = 1;
		while (rs.next ()){
			out.println("<tr><td>"+count+". </td><td colspan='2'>"+rs.getString("fach_")+"</td></tr>");
			count++;
		}
%>
