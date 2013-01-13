<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="database.DBAuslesen"%>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%String str=request.getParameter("queryString");
byte[] utf8bytes = str.getBytes("ISO-8859-1");
str = new String(utf8bytes);
		DBAuslesen db = new DBAuslesen();		
		ResultSet rs = db.searchKonfession(str);
		if(rs != null){
			while (rs.next ()){
				out.println(rs.getString("name_")+"$"+rs.getString("kuerzel_")+";");
			}	
		}
	
%>