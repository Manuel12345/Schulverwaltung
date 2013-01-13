<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<% 
try
{
  String sessionId = request.getQueryString().split("=")[1];
  if(sessionId.equals(session.getId())==false){
	  response.sendRedirect("login.html");
  }
  
}
catch (RuntimeException e)
{
	response.sendRedirect("login.html");
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="./src/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="./src/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="./src/jquery/js/jquery-ui.min.js"></script>
<script src="./src/jquery/js/jquery-1.8.3.js"></script>
 <script src="./src/jquery/js/jquery-ui.js"></script>
<script type="text/javascript" src="./src/schulverwaltung.js"></script>
<style type="text/css">
	.header{
		 font-size: 27pt;
    	 left: 135px;
         position: absolute;
         top: 25px;
         width: 200px;
	}
	.borderTop{
		border-top:2px solid grey;
		position:absolute;
		top:85px;
		width:100%;
		left:0px;
	}
	.borderBottom{
		border-top:2px solid grey;
		position:absolute;
		bottom:55px;
		width:100%;
		left:0px;
	}
	.imgHeader{
		 left: 15px;
    	position: absolute;
    	top: 10px;
    	width: 472px;
	}
	.navBar{
		width:47%;
		height:75%;
		border:1px solid blue;
		position:absolute;
		top:105px;
		left:15px;
		-moz-border-radius:10px; /* Firefox */
		-webkit-border-radius:10px; /* Safari, Chrome */
		-khtml-border-radius:10px; /* Konqueror */
		border-radius:10px; /* CSS3 */
		background:#EEEEEE;
	}
	#contentBar{
		position:absolute;
		top:105px;
		right:15px;
		border:1px solid blue;
		-moz-border-radius:10px;
		-webkit-border-radius:10px;
		-khtml-border-radius:10px;
		border-radius:10px;
		background:#EEEEEE;
	}
	.workTable{
		position:absolute;
		top:150px;
		width:100%;
	}
	span{
		cursor:pointer;
	}
	.tuwas{
		width:100%;
	}
	.toDo{
		width:900px;
		position:absolute;
		left:50%;
		margin-left:-450px;
		top:250px;
	}
	.userData{
   		  left: 500px;
    	  position: absolute;
          top: 35px;
          width: 600px;
	}
	.logout{
		position: absolute;
  		right: 10px;
    	top: 25px;
	}
	
	
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Schulverwaltung</title>
</head>
<body onload="initSchulverwaltung()" style="background-color:lightgray">
	<div style="width:1230px;position:absolute;left:50%;margin-left:-615px;height:95%;background-color:#87cefa;border:2px solid blue;-moz-border-radius:10px;-webkit-border-radius:10px;-khtml-border-radius:10px;border-radius:10px;">
		<img src="./src/img/header_bs.jpg" class="imgHeader"/>
		<div class="header">
			Schulverwaltung 
		</div>
		<div id="navBar" class="navBar">
			<div id="tabs">
				<ul>
					<li><a href="#tabs-1">Auswahlmenü</a></li>
				</ul>
				<div id="tabs-1" class="tabview">
					<span class="tuwas" id="newData">Neue Daten aufnehmen</span><br/>
		  			<span class="tuwas" id="uploadData">Vorhandene Daten mit Hilfe von Excel einpflegen</span><br/>
		  			<span class="tuwas" id="aktuallisieren">Aktualisieren des bestehenden Datenbestandes (z.B. geänderte Adressen einpflegen)</span><br/>
		  			<span class="tuwas" id="synchronisation">Synchronisation (manuelle Eingabe, Eingabe mit Excel)</span><br/>
		 			<span class="tuwas" id="delete">Löschen</span><br/>
					<span class="tuwas" id="versetzen">Versetzen</span><br/>
					<span class="tuwas" id="ausgabe">Ausgabe am Monitor</span>
				</div>
			</div>
		</div>
		<iframe id="contentBar" width="50%" height="75%" marginheight="0" marginwidth="0" frameborder="0"></iframe>
		<div class="userData">
			Sie sind eingelogt als:
			<a class="changeUserData" title="Userdaten ändern" style="cursor:pointer;text-decoration:underline;color:blue">
				<% String attributes  = (String)(request.getAttribute("params")); String[] a = session.getAttribute("params").toString().split(";"); out.print(a[3] + " "); out.print(a[4] + " "); %>
			</a>
			<div style="position:absolute;left:300px;top:0px">
				<label for="search">Schüler suchen: </label>
				<input type="text" name="search" id="search" onkeyup="lookup(this.value);" style="width:185px"/>
			</div>	
		</div>
		<div class="logout"><img src="./src/img/button-logout.png" title="Logout" style="cursor:pointer;height:32px;width:32px"  onclick="var logout = confirm('Wollen Sie sich abmelden?'); if(logout == true){JavaScript:window.location='./jsp/logout.jsp';}"/></div>
		<!--  <div class="borderTop"></div>
		<div class="borderBottom"></div>-->
	</div>
	<div id="dialog" title="Profil bearbeiten" style="display:none">
		<iframe id="content" width="100%" height="500px" marginheight="0" marginwidth="0" frameborder="0"></iframe>
	</div>
</body>
</html>