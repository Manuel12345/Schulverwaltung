<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../src/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="../src/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="../src/jquery/js/jquery-ui.min.js"></script>
<script src="../src/jquery/js/jquery-1.8.3.js"></script>
 <script src="../src/jquery/js/jquery-ui.js"></script>
<script type="text/javascript" src="../src/schulverwaltung.js"></script>
<style type="text/css">
	.slide{
		width:40%%;
	}
	label{
		width:10%;
	}
	input[type=text]{
		width:300px;
	}
	html{
		height:500px;
	}
	.fachCount{
  	  width:35px;
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<form method="POST" action=../ChangeUserDataServlet>
	<div style="height:400px">
		<table>
			<colgroup>
				<col width="150px"/>
				<col width="700px"/>
			</colgroup>
			<tr>
				<td>Benutzername</td>
				<td><input type="text" name="UserName" id="UserName" disabled="disabled" value="<% out.print(session.getAttribute("UserName").toString()); %>"/></td>
			</tr>
			<tr>
				<td>Anrede</td>
				<td><input type="text" name="anrede" id="anrede" disabled="disabled" value="<% String[] a = session.getAttribute("params").toString().split(";");
				   out.print(a[2]); %>"/></td>
			</tr>
			<tr>
				<td><label for="vorname">Vorname:</label></td>
				<td><input type="text" id="vorname" name="vorname" value="<% out.print(a[3]);%>"/></td>
			</tr>
			<tr>
				<td><label for="nachname">Nachname:</label></td>
				<td><input type="text" id="nachname" name="nachname" value="<%out.print(a[4]);%>"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- <input type="submit" value="Speichern"/>-->
					<input type="button" value="Speichern" class="ui-widget button" onclick="var x = confirm('M&ouml;chten Sie die Daten wirklich &Auml;ndern?');if(x==true){this.form.submit()};"/>
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>