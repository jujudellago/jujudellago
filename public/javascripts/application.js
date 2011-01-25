;$(document).ready(function(){

	
	$(".data_link").click(function(){
		//alert("toto");
		var loc=$(this)[0].getAttribute("data-href");
		if (loc!=""){
			//console.log("will go to "+loc);
			window.location.href=loc;
		}
		return false;
	});		

  //  $("img").lazyload({ 
  //      // placeholder : "/javascripts/jquery_lazyload/img/grey.gif",
  //      // 	    effect : "fadeIn",
  //    	event : "mousewheeldown"
  //  
  //  });

});