<%@ page language="java" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link href="../src/jquery/css/ui-lightness/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css"></link>
<script type="text/javascript" src="../src/jquery/js/jquery.min.js"></script>
<script type="text/javascript" src="../src/jquery/js/jquery-ui.min.js"></script>
<script src="../src/jquery/js/jquery-1.8.3.js"></script>
 <script src="../src/jquery/js/jquery-ui.js"></script>
<script type="text/javascript" src="../src/schulverwaltung.js"></script>
<style type="text/css">
	#tabs{
		height:100%;
	}
	/*.ui-widget-content {
	  	background: none repeat scroll 0 0 #FFFFFF;
   		border: 0 none;
    	color: #333333;
	 }*/
	 body{
	 	background: #EEEEEE;
	 }
</style>
</head>
<body onload="initNeueDaten()">
<div id="tabs">
<ul>
<li><a href="#tabs-1">Schüler</a></li>
<li><a href="#tabs-2">Klasse</a></li>
<li><a href="#tabs-3">Betrieb</a></li>
<li><a href="#tabs-4">Lehrer</a></li>
<li><a href="#tabs-5">Fach</a></li>
<li><a href="#tabs-6">Beruf</a></li>
</ul>
<div id="tabs-1" class="tabview">
	<table class="newSchueler">
		<tr>
			<td><label for="schuelerVorname">Vorname: *</label></td>
			<td><input type="text" name="schuelerVorname" id="schuelerVorname" class="schuelerData requiredShueler"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerNachname">Nachname: *</label></td>
			<td><input type="text" name="schuelerNachname" id="schuelerNachname" class="schuelerData requiredShueler"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerRufname">Rufname:</label></td>
			<td><input type="text" name="schuelerRufname" id="schuelerRufname" class="schuelerData"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerGeschlecht">Geschlecht: *</label></td>
			<td><select name="schuelerGeschlecht" id="schuelerGeschlecht" class="schuelerData requiredShueler"><option>Bitte auswählen...</option><option>M</option><option>W</option></select></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<!-- <td><label for="schuelerVorbildung">Vorbildung: *</label></td>
			<td><input type="text" name="schuelerVorbildung" id="schuelerVorbildung" onkeyup="vorbildungAutocomplete(this.value)"/></td>-->
			<td><label for="schuelerVorbildung">Vorbildung: *</label></td>
			<td><select name="schuelerVorbildung" id="schuelerVorbildung" class="schuelerData requiredShueler"></select>
		</tr>
		<tr>
			<td><label for="schuelerGebDatum">Geburtsdatum: *</label></td>
			<td><input type="text" name="schuelerGebDatum" id="schuelerGebDatum" class="datepicker schuelerData requiredShueler" style="width:100px"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerBekenntnis">Konfession: *</label></td>
			<td><input type="text" name="schuelerBekenntnis" id="schuelerBekenntnis" class="schuelerData requiredShueler" onkeyup="bekenntnisAutocomplete(this.value)"/></td>
			<td><span id="konfessionShort"></span></td>
		</tr>
		<tr>
			<td><label for="schuelerNationalitaet">Nationalität: *</label></td>
			<td><input type="text" name="schuelerNationalitaet" class="schuelerData requiredShueler" id="schuelerNationalitaet"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td colspan="3"><label for="schuelerErziehungsberechtigte">Erziehungsberechtigte eintragen </label><input type="checkbox"  id="schuelerErziehungsberechtigte" name="schuelerErziehungsberechtigte" class="slide schuelerData" value="true"/></td>
		</tr>
		<tbody class="schuelerErziehungsberechtigte" style="display:none">
			<tr>
				<td align="right"><label for="erziehungsberechtigterVorname">Vorname:</label></td>
				<td colspan="2">
					<input type="text" name="erziehungsberechtigterVorname" class="erzb" id="erziehungsberechtigterVorname"/>
				</td>
			</tr>
			<tr>
				<td align="right"><label for="erziehungsberechtigterNachname">Nachname:</label></td>
				<td colspan="2">
					<input type="text" name="erziehungsberechtigterNachname"  class="erzb" id="erziehungsberechtigterNachname"/>
				</td>
			</tr>
		</tbody>
		<tr>
			<td><label for="schuelerTel1">Telefon 1: *</label></td>
			<td><input type="text" name="schuelerTel1" id="schuelerTel1" class="schuelerData requiredShueler"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerTel2">Telefon 2:</label></td>
			<td><input type="text" name="schuelerTel2" id="schuelerTel2" class="schuelerData"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerEmail">E-Mail:</label></td>
			<td><input type="text" name="schuelerEmail" id="schuelerEmail" class="schuelerData"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerStrasse">Strasse/Hausnummer: *</label></td>
			<td><input type="text" name="schuelerStrasse" id="schuelerStrasse" class="schuelerData requiredShueler"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerPlz">Postleitzahl: *</label></td>
			<td><input type="text" name="schuelerPlz" id="schuelerPlz" class="schuelerData requiredShueler"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerOrt">Ort: *</label></td>
			<td><input type="text" name="schuelerOrt" id="schuelerOrt" class="schuelerData requiredShueler"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerSchulpflicht">Schulpflichtig:</label></td>
			<td><input type="checkbox" name="schuelerSchulpflicht" id="schuelerSchulpflicht" value="true" class="schuelerData"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerBeruf">Beruf: *</label></td>
			<td colspan="2"><input type="text" name="schuelerBeruf" id="schuelerBeruf" onkeyup="berufAutocomplete(this.value)" style="width:95%" class="schuelerData requiredShueler"/></td>
		</tr>
		<tr>
			<td><label for="schuelerKlasse">Klasse: *</label></td>
			<td colspan="2"><input type="text" name="schuelerKlasse" id="schuelerKlasse" onkeyup="klasseAutocomplete(this.value);" style="width:100px" class="schuelerData requiredShueler"/> KL: <span id="schuelerKlassenlehrer"></td>
		</tr>
		<tr>
			<td><label for="schuelerGruppe">Gruppe:</label></td>
			<td><select name="schuelerGruppe" id="schuelerGruppe" class="schuelerData"><option>Bitte auswählen...</option><option>A</option><option>B</option></select></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td valign="top"><label for="schuelerReligionsunterricht">Religionsunterricht:</label></td>
			<td>
				<input type="radio" name="schuelerReligionsunterricht" class="schuelerData" id="katholisch"  class ="religion" checked="checked" value="katholischer RU"/><label for="katholisch"> katholischer RU</label><br/>
				<input type="radio" name="schuelerReligionsunterricht" class="schuelerData" id="evangelisch" class ="religion" value="evangelischer RU"/><label for="evangelisch"> evangelischer RU</label><br/>
				<input type="radio" name="schuelerReligionsunterricht" class="schuelerData" id="ethik" class ="religion" value="Ethik weil RU nicht angeboten wird"/><label for="ethik"> Ethik </label><br/>
				<input type="radio" name="schuelerReligionsunterricht" class="schuelerData" id="befreit" value="true" disabled="disabled"/>  Befreiung
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td valign="top">Befreiungen:</td>
			<td>
				<input type="checkbox" name="schuelerDeutsch" id="schuelerDeutsch" class="schuelerData" value="true"/><label for="schuelerDeutsch"> Deutsch</label><br/>
				<input type="checkbox" name="schuelerReligion" id="schuelerReligion" class="schuelerData" value="true" onchange="if(this.checked == true){$('#befreit')[0].checked = true;$('.religion').each(function(i,rb){rb.setAttribute('disabled','disabled')});}else{$('#befreit')[0].checked = false;$('.religion').each(function(i,rb){rb.removeAttribute('disabled')});$('#katholisch')[0].checked = true}"/><label for="schuelerReligion"> Religion</label><br/>
			</td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="schuelerBetrieb">Betrieb: *</label></td>
			<td colspan="2"><input type="text" name="schuelerBetrieb" class="schuelerData requiredShueler" id="schuelerBetrieb" style="width:95%" onkeyup="betriebAutocomplete(this.value);"/></td>
		</tr>
		<tr>
			<td><label for="betriebDaten">Betrieb Info:</label></td>
			<td colspan="2"><span name="betriebDaten" id="betriebDaten"></span></td>
		</tr>
		<tr>
			<td><label for="betriebAusbilder">Ausbilder:</label></td>
			<td colspan="2"><span name="betriebAusbilder" id="betriebAusbilder"></span></td>
		</tr>
		<tr>
			<td><label for="betriebAusbilderEmail">Ausbilder E-Mail:</label></td>
			<td colspan="2"><span name="betriebAusbilderEmail" id="betriebAusbilderEmail"></span></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>	
		<tr>
			<td colspan="2">&nbsp;</td>
			<td><input type="button" value="Schüler anlegen" onclick="newSchueler();"/></td>
		</tr>		
	</table>
</div>
<div id="tabs-2" class="tabview">
	<table class="newKlasse">
		<tr>
			<td><label for="klasse">Klasse: *</label></td>
			<td><input type="text" name="klasse" id="klasse"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="lehrer">Lehrer: *</label></td>
			<td><input type="text" name="lehrer" id="lehrer" onkeyup="lehrerAutocomplete(this.value);"/></td>
			<td><input type="button" value="Klasse anlegen" onclick="newKlasse();"/></td>
		</tr>		
	</table>
</div>
<div id="tabs-3" class="tabview">
	<table class="newBetrieb">
		<tr>
			<td><label for="betrieb">Betrieb: *</label></td>
			<td colspan="2"><input type="text" name="betrieb" id="betrieb" style="width:95%"/></td>
		</tr>
		<tr>
			<td><label for="strasse">Strasse/Hausnummer: *</label></td>
			<td colspan="2"><input type="text" name="strasse" id="strasse" style="width:95%"/></td>			
		</tr>	
		<tr>
			<td><label for="plz">Postleitzahl: *</label></td>
			<td colspan="2"><input type="text" name="plz" id="plz"/></td>		
		</tr>	
		<tr>
			<td><label for="ort">Ort: *</label></td>
			<td colspan="2"><input type="text" name="ort" id="ort"/></td>			
		</tr>
		<tr>
			<td><label for="ausbilder">Ausbilder: *</label></td>
			<td colspan="2"><input type="text" name="ausbilder" id="ausbilder"/></td>			
		</tr>
		<tr>
			<td><label for="ausbilderMail">E-Mail: *</label></td>
			<td colspan="2"><input type="text" name="ausbilderMail" id="ausbilderMail"/></td>			
		</tr>	
		<tr>
			<td><label for="betriebTelefon">Telefon: *</label></td>
			<td><input type="text" name="betriebTelefon" id="betriebTelefon"/></td>		
			<td><input type="button" value="Betrieb anlegen" onclick="newBetrieb();"/></td>			
		</tr>	
	</table>
</div>
<div id="tabs-4" class="tabview">
	<table class="newTeacher">
		<tr>
			<td><label for="vorname">Vorname: *</label></td>
			<td><input type="text" name="vorname" id="vorname"/></td>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td><label for="nachname">Nachname: *</label></td>
			<td><input type="text" name="nachname" id="nachname"/></td>
			<td><input type="button" value="Lehrer anlegen" onclick="newLehrer();"/></td>
		</tr>		
	</table>
</div>
<div id="tabs-5" class="tabview">
	<table class="fach">
		<tr>
			<td><label for="fachName">Fach: *</label></td>
			<td><input type="text" name="fach" id="fach"/></td>
			<td><input type="button" value="Fach anlegen" onclick="newFach();"/></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
	</table>
</div>
<div id="tabs-6" class="tabview">
	<table class="newBeruf">
		<tr>
			<td><label for="fachName">Bezeichnung: *</label></td>
			<td colspan="2"><input type="text" name="beruf" id="beruf" style="width:300px"/></td>
		</tr>
		<tr>
			<td colspan="3">&nbsp;</td>
		</tr>
		<tr>
			<td><input type="button" value="Beruf anlegen" onclick="newBeruf();"/></td>
			<td colspan="2"></td>
		</tr>
	</table>
</div>
</div>
</body>
</html>