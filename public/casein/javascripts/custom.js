// CASEIN CUSTOM
// Use this file for your project-specific Casein JavaScript
$.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})


;$(document).ready(function(){
	$(".enabledisable img").live("click",function(){
		$(this).attr("src","/images/spinner.gif");
	});

	$("input.datepicker").datepicker({
	     changeMonth: false,
	     changeYear: false,
  		 dateFormat: 'yy-mm-dd',
		 yearRange: '1930:2014'
	});
	


 // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

	$('.fancy_box').fancybox(); 
	$('.fancy_box_large').fancybox({
		'frameWidth':780,	
		'frameHeight':400
	}); 
	$('.fancy_box_form').fancybox({
		'hideOnOverlayClick': false,
		'hideOnContentClick': false,
		'callbackOnShow' : function(){
			$('#fancy_content form').validate({
				submitHandler: function(form) {
				   	$(form).submitWithAjax();
				}
			});

		}	 	
	});

});




