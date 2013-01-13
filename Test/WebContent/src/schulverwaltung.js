
timer = 0;
// Initfunctions for pages

//hauptseite
initSchulverwaltung=function(){
	 $(".tuwas").button();
	 tabs();
	dialogfunktion();
	navigation();
	datepicker();
}

//neue Daten
initNeueDaten = function(){
	tabs();
	slideFunction();
	fillVorbildung();
	datepicker();
	showBetriebe();
	showKlassen();
	showFach();
	createFachCheckboxes();
	//showTeachers();
}

datepicker=function(){
		  $(".datepicker" ).datepicker({dateFormat: 'dd.mm.yy'});
		  $.datepicker.regional['de'] = {clearText: 'löschen', clearStatus: 'aktuelles Datum löschen',
						closeText: 'schließen', closeStatus: 'ohne Änderungen schließen',
						prevText: '<zurück', prevStatus: 'letzten Monat zeigen',
						nextText: 'Vor>', nextStatus: 'nächsten Monat zeigen',
						currentText: 'heute', currentStatus: '',
						monthNames: ['Januar','Februar','März','April','Mai','Juni',
						'Juli','August','September','Oktober','November','Dezember'],
						monthNamesShort: ['Jan','Feb','Mär','Apr','Mai','Jun',
						'Jul','Aug','Sep','Okt','Nov','Dez'],
						monthStatus: 'anderen Monat anzeigen', yearStatus: 'anderes Jahr anzeigen',
						weekHeader: 'Wo', weekStatus: 'Woche des Monats',
						dayNames: ['Sonntag','Montag','Dienstag','Mittwoch','Donnerstag','Freitag','Samstag'],
						dayNamesShort: ['So','Mo','Di','Mi','Do','Fr','Sa'],
						dayNamesMin: ['So','Mo','Di','Mi','Do','Fr','Sa'],
						dayStatus: 'Setze DD als ersten Wochentag', dateStatus: 'Wähle D, M d',
						dateFormat: 'dd.mm.yy', firstDay: 1,
						initStatus: 'Wähle ein Datum', isRTL: false};
				$.datepicker.setDefaults($.datepicker.regional['de']);
	
}

navigation=function(){
	$('.tuwas').click(function(){
		var contentString = contentFunction(this.id);
		$("#contentBar")[0].setAttribute("src",contentString);
	});
}

lookup=function(inputString){
	var schueler = new Array;
	var x="";
	$.get("./jsp/searchSchueler.jsp", {queryString: ""+inputString+""}, function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length;x++){
			schueler[x] = {
					value: newArray[x]
				};
		}
	});
	$( "#search" ).autocomplete({
		source: schueler,
		minLength: 0,
		select: function( event, ui ) {
			//$("#ansprechpartner_name" ).val( ui.item.value );
			//$('')[0].setAttribute('src','schueler.html')
			$("#contentBar")[0].setAttribute("src","./content/datenBearbeiten.jsp");
			x= ui.item.value;
			//writeContent(x);
			
		}
	});
	writeContent(x);
}

writeContent=function(x){
	if($('iframe')[0].contentDocument.getElementById('blub') != null)
		$('iframe')[0].contentDocument.getElementById('blub').innerHTML = x;
}

dialogfunktion=function(){
	$('.changeUserData').click(function(){
		var contentArray = contentFunction(this.className);
		$('#content')[0].setAttribute('src',"./content/changeUserData.jsp");
			$('#dialog').dialog({ 
				show: "slide",
				hide: { effect: 'drop', direction: "down" },
				modal: true,
				minWidth: 900,
				minHeight: 500
			});	
	});
}

contentFunction = function(idGot){
	var title = "";
	var content = "";
		switch(idGot){
		case "newData":
			content = "./content/neueDaten.jsp";
			break;
		case "uploadData":
			content = "./content/uploadData.jsp";
			break;
		case "aktuallisieren":
			content = "./content/datenBearbeiten.jsp";
			break;
		case "synchronisation":
			content = "./content/synchronisation.jsp";
			break;
		case "delete":
			content = "./content/delete.jsp";
			break;
		case "versetzen":
			content="./content/versetzten.jsp";
			break;
		case "ausgabe":
			content="./content/ausgabe.jsp";
			break;
		case "search":
			content="./content/suche.jsp";
			break;
		case "changeUserData":
			content="./content/changeUserData.jsp";
			break;
		default:
			content = "error.html"
		}
	//returnArray.push(title);
	//returnArray.push(content);
	return content;
}

//content for neueDaten

addAndRemoveFach = function(){
	 var addNote =function(){
		var  partToClone = $('.addFach')[0];
		//partToClone = partToClone -1;
		$(partToClone).clone().appendTo('.leistungstable');
		var cloneCount = 0;
		$('.addFach').each(function(i, curFach){
			var cloneNumber = curFach.children[0].children[0].children[0].id.split("[");
			cloneNumber = cloneNumber[1].charAt(0);
			var firstElement = curFach.children[0].children[0].children[0];
			var secondElement = curFach.children[0].children[1].children[0];
			firstElement.setAttribute('name', 'fach['+cloneCount+']');
			firstElement.setAttribute('id', 'fach['+cloneCount+']');
			secondElement.setAttribute('name', 'note['+cloneCount+']');
			secondElement.setAttribute('id', 'note['+cloneCount+']');
			cloneCount ++;
			//toDo: give them different id#s and names
		});
	}
	 var removeNote = function(){
		var partToRemoveArray = $('.addFach');
		partToRemove = partToRemoveArray[partToRemoveArray.length - 1];
		if(partToRemoveArray.length == 1){
			alert('Sie können diese Position nicht löschen.')
		}
		else{
			$('.leistungstable')[0].removeChild(partToRemove);
		}
	}
	 $('.fachCount').click(function(){
		 if(this.getAttribute('title')=="hinzufügen"){
			 addNote();
		 }
		 else{
			 removeNote();
		 }
	 });
}
tabs=function(){
	$( "#tabs" ).tabs({
		select: 1
	});
}

slideFunction = function(){
	$('.slide').click(function() {
		if ($('.'+this.id).is(":hidden")) {
			$('.'+this.id).slideDown("slow");
		} else {
			$('.'+this.id).hide();
		}
	});
}


newFach=function(){
	var tw = this.window.location;
	var newFach = $('#fach')[0].value; 
	$.get('../jsp/newFach.jsp', {queryString: newFach},function(){
		alert(arguments[0]);
		$('#fach')[0].value = "";
		tw.reload();
	});
}
newLehrer=function(){
	var tw = this.window.location;
	var newLehrer = $('#vorname')[0].value; 
	newLehrer+= ";"+$('#nachname')[0].value; 
	var lehrerToFach ="";
	$('.faecherCheckboxen').each(function(i, box){
		if(box.checked == true){
			lehrerToFach+= box.value + ",";
		}
	});
	$.get('../jsp/newLehrer.jsp', {queryStringOne: newLehrer, queryStringTwo: lehrerToFach},function(){
		alert(arguments[0]);
		$('#vorname')[0].value = "";
		$('#nachname')[0].value = ""; 
		tw.reload();
	});
}

newKlasse=function(){
	var tw = this.window.location;
	var newKlasse = $('#klasse')[0].value; 
	var lehrer2Klasse= $('#lehrer')[0].value; 
	
	$.get('../jsp/newKlasse.jsp', {queryStringOne: newKlasse, queryStringTwo: lehrer2Klasse},function(data){
		alert(data);
		$('#klasse')[0].value = "";
		$('#lehrer')[0].value = ""; 
		tw.reload();
	});
	
}
newBetrieb=function(){
	var tw = this.window.location;
	var newBetrieb = $('#betrieb')[0].value;
	var newAusbilder = $('#ausbilder')[0].value;
	var newEmail = $('#ausbilderMail')[0].value;
	var newAdresse = $('#strasse')[0].value + ", " + $('#plz')[0].value + " "  + $('#ort')[0].value +", Tel. " + $('#betriebTelefon')[0].value;
	$.get('../jsp/newBetrieb.jsp', {newBetrieb: newBetrieb, newAusbilder: newAusbilder, newEmail: newEmail, newAdresse: newAdresse },function(data){
		alert(data);
		$('#betrieb')[0].value = "";
		$('#ausbilder')[0].value = ""; 
		$('#ausbilderMail')[0].value = ""; 
		$('#strasse')[0].value = ""; 
		$('#plz')[0].value = ""; 
		$('#ort')[0].value = ""; 
		$('#betriebTelefon')[0].value = ""; 
		tw.reload();
	});
}

newBeruf = function(){
	var tw = this.window.location;
	var newBeruf = $('#beruf')[0].value;
	
	$.get('../jsp/newBeruf.jsp', {newBeruf: newBeruf },function(data){
		alert(data);
		$('#beruf')[0].value = "";
		tw.reload();
	});
}

newSchueler=function(){
	var tmpString = "";
	var createSchueler = true;
	schuelerDataFieldsArray = $('.schuelerData');
	schuelerDataFieldsArray.each(function(i, curField){
		if(curField.type == "checkbox"){
			if(curField.checked == true){
				tmpString += curField.id +": "+curField.value +", ";
				if(tmpString.id == "schuelerErziehungsberechtigte"){
					$('.erzb').each(function(i, field){
						tmpString += field.id +": "+field.value +", ";
					});
				}
			}
			else{
				tmpString += curField.id +": false, ";
			}
		}
		else if(curField.type == "radio"){
			if(curField.checked == true){
				tmpString += curField.id +": "+curField.value +", ";
			}
		}
		else if(curField.tagName == "SELECT"){
			if(curField.className.indexOf('requiredShueler') != -1){
				if(this.value == "Bitte auswählen..."){
					createSchueler = false;
					return false;
				}
			}
			tmpString += curField.id +": "+curField.value +", ";
		}
		else{
			if(curField.className.indexOf('requiredShueler') != -1){
				if(this.value.length<1){
					createSchueler = false;
					return false;
				}
			}
			tmpString += curField.id +": "+curField.value +", ";
		}	
	});
	tmpString = tmpString.substring(0,tmpString -1);
	if(createSchueler == false){
		alert(tmpString);
		alert('Bitte füllen Sie alle Pflichtfelder aus!');
	}
	else{
		
	}
}

showBetriebe = function(){
	$.get('../jsp/showBetrieb.jsp', function(strGot){
		var table = $(".newBetrieb")[0];
		table.innerHTML += "<tr><td colspan='3'>Bereits angelegte Betriebe:</td></tr><tr><td colspan='3'>&nbsp;</td></tr>";
		table.innerHTML += "<tr><td>Betrieb</td><td colspan='2'>Ansprechpartner</td></tr>";
		table.innerHTML += strGot;
	});
}

showKlassen = function(){
	$.get('../jsp/showKlasse.jsp', function(strGot){
		var table = $(".newKlasse")[0];
		table.innerHTML += "<tr><td colspan='3'>Bereits angelegte Klassen:</td></tr><tr><td colspan='3'>&nbsp;</td></tr>";
		table.innerHTML += "<tr><td>Nr</td><td>Klasse</td><td>Lehrer</td></tr>";
		table.innerHTML += strGot;
	});	
	
}

showFach=function(){
		$.get('../jsp/showFach.jsp', function(strGot){
			var table = $(".fach")[0];
			table.innerHTML += "<tr><td colspan='3'>Bereits angelegte F&auml;cher:</td></tr><tr><td colspan='3'>&nbsp;</td></tr>";
			table.innerHTML += strGot;
		});	
}

createFachCheckboxes = function(){
		inputString="";
		$.get("../jsp/searchFach.jsp", {queryString: ""+inputString+""}, function(data){
			var newArray = data;
			var tmpString="";
			newArray = newArray.split(";");
			newArrayLength = newArray.length -1;
			tmpString+="<tr><td colspan='3'>&nbsp;</td></tr>";
			tmpString+="<tr><td colspan='3'>Bitte w&auml;hlen Sie die zu unterrichtenden F&auml;cher: *</td></tr>";
			tmpString+="<tr><td colspan='3'>&nbsp;</td></tr>";
			for(var x=0;x<newArrayLength;x++){
				var curFach = newArray[x].split(",")[1];
				var curId = newArray[x].split(",")[0];
				tmpString+= "<tr><td><label for='"+curFach+"'>"+curFach+": </label></td><td colspan='2'><input type='checkbox' class='faecherCheckboxen' name='"+curFach+"' id='"+curFach+"' value='"+curId+"'/></td></tr>";
			}
			$('.newTeacher')[0].innerHTML += tmpString;
		});
}

fillVorbildung=function(){
	var select = $('#schuelerVorbildung')[0];
	var vorbildungArray = new Array;
	$(select).empty();
	select.setAttribute('style','width:182px');
	$("<option/>").val("Bitte auswählen...").text("Bitte auswählen...").appendTo(select);
	$.get("../jsp/searchVorbildung.jsp", function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length - 1;x++){
			var value = newArray[x];
			$("<option/>").val(value).text(value).appendTo(select);
		}
	});
	
}

lehrerAutocomplete=function(inputString){
	var lehrerArray = new Array;
	$.get("../jsp/searchLehrer.jsp", {queryString: ""+inputString+""}, function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length;x++){
			lehrerArray[x] = {
					value: newArray[x]
				};
		}
	});
	$( "#lehrer" ).autocomplete({
		source: lehrerArray,
		minLength: 0,
		select: function( event, ui ) {
			//$("#ansprechpartner_name" ).val( ui.item.value );
			//$('')[0].setAttribute('src','schueler.html')
		}
	});
}

klasseAutocomplete=function(inputString){
	var klasseArray = new Array;
	var posKlasse = 0;
	var posVorname = 1;
	var posNachname = 2;
	$.get("../jsp/searchKlasse.jsp", {queryString: ""+inputString+""}, function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length;x++){
			var curArray = newArray[x].split(",");
			klasseArray[x] = {
					value: curArray[posKlasse],
					vorname: curArray[posVorname],
					nachname: curArray[posNachname]
				};
		}
	});
	$( "#schuelerKlasse" ).autocomplete({
		source: klasseArray,
		minLength: 0,
		select: function( event, ui ) {
			var value = ui.item.vorname + " " +  ui.item.nachname;
			
			$("#schuelerKlassenlehrer" )[0].innerHTML = value;
			
		}
	});
}

betriebAutocomplete=function(inputString){
	var betriebs = new Array;
	var posBetrieb = 0;
	var posData = 1;
	var posAusbilder = 2;
	var posAusbilderEmail = 3;
	$.get("../jsp/searchBetrieb.jsp", {queryString: ""+inputString+""}, function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length;x++){
			var curArray = newArray[x].split("$");
			betriebs[x] = {
					value: curArray[posBetrieb],
					daten: curArray[posData],
					ausbilder: curArray[posAusbilder],
					mail: curArray[posAusbilderEmail]
				};
		}
	});
	$( "#schuelerBetrieb" ).autocomplete({
		source: betriebs,
		minLength: 0,
		select: function( event, ui ) {
			var daten = ui.item.daten;
			var ausbilder = ui.item.ausbilder;
			var mail = ui.item.mail;
			
			$("#betriebDaten" )[0].innerHTML = daten;
			$("#betriebAusbilder" )[0].innerHTML = ausbilder;
			$("#betriebAusbilderEmail" )[0].innerHTML = mail;		
		}
	});
}

berufAutocomplete=function(inputString){
	var berufs = new Array;
	$.get("../jsp/searchBeruf.jsp", {queryString: ""+inputString+""}, function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length;x++){
			berufs[x] = {
					value: newArray[x]
				};
		}
	});
	$( "#schuelerBeruf" ).autocomplete({
		source: berufs,
		minLength: 0
	});

}

vorbildungAutocomplete = function(inputString){
	var bildung = new Array;
	$.get("../jsp/searchVorbildung.jsp", {queryString: ""+inputString+""}, function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length;x++){
			bildung[x] = {
					value: newArray[x]
				};
		}
	});
	$( "#schuelerVorbildung" ).autocomplete({
		source: bildung,
		minLength: 0
	});

}

bekenntnisAutocomplete = function(inputString){
	var konfession = new Array;
	if(inputString.length <= 1){
		$("#konfessionShort" )[0].innerHTML = "";
	}
	$.get("../jsp/searchKonfession.jsp", {queryString: ""+inputString+""}, function(data){
		var newArray = data;
		newArray = newArray.split(";");
		for(var x=0;x<newArray.length;x++){
		var valuesArray = newArray[x].split("$");
			konfession[x] = {
					value: valuesArray[0],
					abk: valuesArray[1]
				};
		}
	});
	$( "#schuelerBekenntnis" ).autocomplete({
		source: konfession,
		minLength: 0,
		select: function( event, ui ) {			
			$("#konfessionShort" )[0].innerHTML = ui.item.abk;	
		}
	});
	
}
/*fachMultiAutocomplete=function(){
$('#fachMultiAutocomplete').keyup(function() { 
	var getFachArray = function(inputString){		
		$.ajax({
			type: "POST",
			url: "../jsp/searchFach.jsp?string="+inputString,
			//queryString: "'"+inputString+"'",
			success: function(data){
				var newArray = data.split(";");
				newArrayLength = newArray.length -1;
				for(var x=0;x<newArrayLength;x++){
					fachArray[x] = {
							value: newArray[x]
					};
				}
			}
		});
	}
	var separator = ",";
	function split( val ) {
		var matcher=new RegExp(separator+"\s*")
		return val.split( matcher );
	}
	function extractLast( term ) {			
		inputString =  split( term ).pop();
		return inputString;
		//return fach;
	}
	$( "#fachMultiAutocomplete" ) 
	// don't navigate away from the field on tab when selecting an item
	.bind( "keydown", function( event ) {
		if ( event.keyCode === $.ui.keyCode.TAB &&
				$( this ).data( "autocomplete" ).menu.active ) {
			event.preventDefault();
		}
	})
	.blur(function( event ) {	
	  	var matcher=new RegExp(separator+"*$");
		this.value=this.value.replace(matcher,"");

	})
	 .autocomplete({
		source: function(request, response){
			response( $.ui.autocomplete.filter(
					fachArray, getFachArray( extractLast(request.term) ) ) );
		},
		minLength: 0,
		focus: function() {
			// prevent value inserted on focus
			return false;
		},
		select: function( event, ui ) {
			var terms = split(this.value);
			// remove the current input
			terms.pop();
			// add the selected item
			terms.push( ui.item.value );
			// add placeholder to get the comma-and-space at the end
			//terms.push( "" );
			this.value = terms.join( separator + " " );
			return false;
		},
		close: function(event, ui){
			var autocompleteFields = $('.ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all');
			for (var a=0;a<autocompleteFields.length;a++){
					var curAutocompleteField = autocompleteFields[a];
				//	curAutocompleteField.style['max-height'] = "20px";
					curAutocompleteField.className = "ui-autocomplete ui-menu ui-widget ui-widget-content ui-corner-all";
				}
		}
	});
});
}*/
