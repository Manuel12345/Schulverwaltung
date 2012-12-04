<%@page import="model.ZinsberechnungsBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Ergebnis</title>
</head>
<body>
	<%
	double geldstart = (Double)(request.getAttribute("Anfangsbetrag"));
	double zinssatz = (Double)(request.getAttribute("Zins"));
	double laufzeit = (Double)(request.getAttribute("Laufdauer"));
	double ergebnis = (Double)(request.getAttribute("Ergebnis"));
	
	out.print("Betrag: " + geldstart + " &euro;<br/>Zinssatz: " + zinssatz + " %<br/>Laufzeit: " + laufzeit + " Tage<br/>Endbetrag: " + ergebnis + " &euro;");
	%>
</body>
</html>