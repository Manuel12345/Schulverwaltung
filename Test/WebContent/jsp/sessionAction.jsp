<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.util.*" %>
<%
	String str = request.getParameter("UserName");
	session.setAttribute("UserName", request.getParameter("UserName"));
	String givenPw = request.getParameter("Password");
	String setPw = request.getAttribute("pw").toString();
	String attributes = request.getAttribute("params").toString();
	session.setAttribute("params", attributes);
	if (givenPw.equals(setPw)){
			response.sendRedirect("./index.jsp?id="+session.getId());
			//session.getId().equals("test"); 
		}
		else{
			response.sendRedirect("./login.html");
		}
%>
</body>
</html>