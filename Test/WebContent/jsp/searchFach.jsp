<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
//String str=request.getParameter("queryString");
//String str = request.getQueryString().split("=")[1];
		DBAuslesen db = new DBAuslesen();		
		ResultSet rs = db.searchFach();
		if(rs != null){
			while (rs.next ()){
				out.println(rs.getString("idfach_") + "," + rs.getString("fach_")+";");
			}	
		}
	
%>