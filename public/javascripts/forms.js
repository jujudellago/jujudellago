



;$(document).ready(function(){	
	$('input[data-ui-date-picker], li.date_picker input, input.ui-date-picker').datepicker({ 
		yearRange: '1920:2012',
		dateFormat: 'yy-mm-dd',
		showAnim: 'fold' ,
		changeYear: true,
		changeMonth: true 
	});
	$('input[data-ui-datetime-picker], input.ui-datetime-picker').datepicker({ dateFormat: 'yy-mm-dd' });
	$('input[data-ui-time-picker]').timepicker({
	    timeSeparator: ':',           // The caracter to use to separate hours and minutes. (default: ':')
	    showPeriod: false,            // Define whether or not to show AM/PM with selected time. (default: false)
	    hourText: 'Hour',             // Define the locale text for "Hours"
	    minuteText: 'Minute',         // Define the locale text for "Minute"
	});
	
	$('input[data-send-remote]').live("click",function(event){
		event.preventDefault();
		var form=$('input[data-send-remote]').parents('form:first');
		var url=form.attr("action");
		var data=$("#products_search").serialize();
		$.post(url, data, null, "script");
		
	  //  $("#products_search input").keyup(function() {
	  //    $.get($("#products_search").attr("action"), $("#products_search").serialize(), null, "script");
	  //    history.replaceState(null, document.title, $("#products_search").attr("action") + "?" + $("#products_search").serialize());
	  //  });
		
		//console.log("sending form remotely");

	});	
	
	
});




