<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="./src/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="./src/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="./src/jquery/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="./src/schulverwaltung.js"></script>
<style type="text/css">
	.slide{
		width:40%%;
	}
	label{
		width:10%;
	}
	input[type=text]{
		width:70%;
	}
	html{
		height:500px;
	}
	.fachCount{
  	  width:35px;
	}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body onload = "initNeueDaten()">
<div>
	<span class="slide" id="neuerSchueler">Neuen Schüler anlegen</span>
	<span class="slide" id="schuelerLeistungserhebung">Leistungen eintragen</span>
	<br/>
	<div class="neuerSchueler" style="display:none;height:400px">
		<table>
			<colgroup>
				<col width="100px"/>
				<col width="750px"/>
			</colgroup>
			<tr>
				<td><label for="vorname">Vorname:</label></td>
				<td><input type="text" id="vorname" name="vorname"/></td>
			</tr>
			<tr>
				<td><label for="nachname">Nachname:</label></td>
				<td><input type="text" id="nachname" name="nachname"/></td>
			</tr>
			<tr>
				<td><label for="strasse">Strasse:</label></td>
				<td><input type="text" id="strasse" name="strasse"/></td>
			</tr>
			<tr>
				<td><label for="plz">PLZ:</label></td>
				<td><input type="text" id="plz" name="plz"/></td>
			</tr>
			<tr>
				<td><label for="wohnort">Wohnort:</label></td>
				<td><input type="text" id="wohnort" name="wohnort"/></td>
			</tr>
			<tr>
				<td><label for="telefon">Telefon:</label></td>
				<td><input type="text" id="telefon" name="telefon"/></td>
			</tr>
			<tr>
				<td><label for="eltern">Eltern:</label></td>
				<td><input type="text" id="eltern" name="eltern"/></td>
			</tr>
			<tr>
				<td><label for="betriebName">Betrieb:</label></td>
				<td><input type="text" name="betriebName" id="betriebName"/></td>
			</tr>
			<tr>
				<td><label for="betriebKontakt">Betrieb Kontakt:</label></td>
				<td><input type="text" name="betriebKontakt" id="betriebKontakt"/></td>
			</tr>
			<tr>
				<td><label for="ausbilder">Ausbilder:</label></td>
				<td><input type="text" name="ausbilder" id="ausbilder" /></td>
			</tr>
			<tr>
				<td><label for="vorbildung">Vorbildung:</label></td>
				<td><input type="text" name="vorbildung" id="vorbildung"/></td>
			</tr>
			<tr>
				<td><label for="schulklasse">Schulklasse:</label></td>
				<td><input type="text" name="schulklasse" id="schulklasse"/></td>
			</tr>
			<tr>
				<td><label for="gruppeneinteilung">Gruppeneinteilung:</label></td>
				<td><select name="gruppeneinteilung" id="gruppeneinteilung"><option>Bitte auswählen...</option><option>A</option><option>B</option></select></td>
			</tr>
			<tr>
				<td>Befreiungen:</td>
				<td>
					<label for="deutschbefreit">Deutsch </label> 
					<input type="checkbox" id="deutschbefreit" id="deutschbefreit" value="true"/> 
					<label for="religionbefreit">Religion</label>
					<input type="checkbox" id="religionbefreit" name="religionbefreit" value="true"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="anlegen"/>
				</td>
			</tr>
		</table>
	</div>
	<div class="schuelerLeistungserhebung" style="display:none;height:400px">
		<table class="leistungstable">
			<colgroup>
				<col width="100px"/>
				<col width="750px"/>
			</colgroup>
			<tr>
				<td><label for="schuelerVorname">Vorname:</label></td>
				<td><input type="text" id="schuelerVorname" class="autocomplete" name="schuelerVorname"/></td>
			</tr>
			<tr>
				<td><label for="schuelerNachname">Nachname:</label></td>
				<td><input type="text" id="schuelerNachname" name="schuelerNachname" disabled="disabled"/></td>
			</tr>
			<tr>
				<td><label for="schuelerSchulklasse">Schulklasse:</label></td>
				<td><input type="text" name="schuelerSchulklasse" id="schuelerSchulklasse" disabled="disabled"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<b>Leistungen erfassen</b>
				</td>
			</tr>
			<tr>
				<td>Fach</td>
				<td>Note</td>
			</tr>
			<tbody class="addFach">
			<tr>
				<td>
					<select class="fach" id="fach[0]" name="fach[0]">
						<option>Bitte auswählen...</option>
						<option>Deutsch</option>
						<option>Englisch</option>
						<option>BWP</option>
						<option>AEP</option>
						<option>Religion</option>
						<option>Sport</option>
						<option>Sozialkunde</option>
					</select>
				</td>
				<td>
					<select name="note[0]" id="note[0]" >
						<option>Bitte auswählen...</option>
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
					</select>
				</td>
			</tr>
			</tbody>
		</table>
		<br/><img src="src/img/Plus.png" class="fachCount" title="hinzufügen" style="cursor:pointer"></img>&#160;<img src="src/img/Minus.png" class="fachCount" title="entfernen" style="cursor:pointer"></img>
		<br/><input type="submit" value="Leistungen erfassen"/>
	</div>
</div>
</body>
</html>