<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
		DBAuslesen db = new DBAuslesen();
		ResultSet rs = db.showBetrieb();

		while (rs.next ()){
			out.println("<tr><td>"+rs.getString("betrieb_")+"</td><td colspan='2'><a title ='"+rs.getString("ausbilderEmail_")+"'>"+rs.getString("ausbilder_")+" <img src='../src/img/infosymbol.png'/></a></td></tr>");
		}
%>
