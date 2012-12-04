<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="./src/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="./src/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="./src/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./src/schulverwaltung.js"></script>
<style type="text/css">
	.header{
		position:absolute;
		top:0%;
		left:50%;
		width:200px;
		margin-top:30px;
		margin-left:-135px;
		font-size:35pt;
	}
	.imgHeader{
		position:absolute;
		top:0%;
		left:50%;
		margin-left:-492px;
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
		width:900px;
	}
	.toDo{
		width:900px;
		position:absolute;
		left:50%;
		margin-left:-450px;
		top:150px;
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Schulverwaltung</title>
</head>
<body onload="initSchulverwaltung()">
	<div style="width:100%">
		<img src="./src/img/header_bs.jpg" class="imgHeader"/>
		<div class="header">
			Schulverwaltung
		</div>
			<div class="toDo">
				<span class="tuwas" id="newData">Neue Daten aufnehmen</span><br/>
				<span class="tuwas" id="uploadData">Vorhandene Daten mit Hilfe von Excel einpflegen</span><br/>
				<span class="tuwas" id="aktuallisieren">Aktualisieren des bestehenden Datenbestandes (z.B. geänderte Adressen einpflegen)</span><br/>
				<span class="tuwas" id="synchronisation">Synchronisation (manuelle Eingabe, Eingabe mit Excel)</span><br/>
				<span class="tuwas" id="delete">Löschen</span><br/>
				<span class="tuwas" id="versetzen">Versetzen</span><br/>
				<span class="tuwas" id="ausgabe">Ausgabe am Monitor</span><br/>
				<span class="tuwas" id="search">Suchabfrage</span>
			</div>
	</div>
	<div id="dialog" title="Hier kann etwas getan werden" style="display:none">
		<iframe id="content" width="100%" height="500px" marginheight="0" marginwidth="0" frameborder="0"></iframe>
	</div>
</body>
</html>