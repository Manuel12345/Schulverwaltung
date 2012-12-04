//Content for indexpage

initSchulverwaltung=function(){
	 $(".tuwas").button();
	dialogfunktion();
}

dialogfunktion=function(){
	//$('#content')[0].innerHTML = tmpString;
	$('.tuwas').click(function(){
	var contentArray = contentFunction(this.id);
	$('#dialog')[0].setAttribute('title',contentArray[0]);
	$('#content')[0].setAttribute('src',contentArray[1]);
		$('#dialog').dialog({ 
			buttons: { "Ok": function() { $(this).dialog("close"); } },
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
	var returnArray = new Array();
		switch(idGot){
		case "newData":
			title = "Neue Daten aufnehmen";
			content = "neueDaten.jsp";
			break;
		case "uploadData":
			title = "Vorhandene Daten mit Hilfe von Excel einpflegen";
			content = "uploadData.jsp";
			break;
		case "aktuallisieren":
			title = "Aktualisieren des bestehenden Datenbestandes (z.B. geänderte Adressen einpflegen)";
			content = "aktuallisieren.jsp";
			break;
		case "synchronisation":
			title = "Synchronisation (manuelle Eingabe, Eingabe mit Excel)";
			content = "synchronisation.jsp";
			break;
		case "delete":
			title = "Löschen";
			content = "delete.jsp";
			break;
		case "versetzen":
			title ="Versetzen";
			content="versetzten.jsp";
			break;
		case "ausgabe":
			title="Ausgabe am Monitor";
			content="ausgabe.jsp";
			break;
		case "search":
			title="Suchabfrage";
			content="suche.jsp";
			break;
		default:
			title="Fehler";
			content = "error.html"
		}
	returnArray.push(title);
	returnArray.push(content);
	return returnArray;
}

//content for neueDaten


initNeueDaten = function(){
	addAndRemoveFach();
	 $(".slide").button();
	slideFunction();
}
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


slideFunction = function(){
	$('.slide').click(function() {
		if ($('.'+this.id).is(":hidden")) {
			$('.'+this.id).slideDown("slow");
		} else {
			$('.'+this.id).hide();
		}
	});
}