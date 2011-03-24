;$(document).ready(function(){
	$.blockUI.defaults.css = {};
	
	$(".data_link").click(function(){
		//alert("toto");
		var loc=$(this)[0].getAttribute("data-href");
		if (loc!=""){
			//console.log("will go to "+loc);
			window.location.href=loc;
		}
		return false;
	});		
	
	$('.video_functions a , .video_box a').live("click",function(){
        $('#video_code').block({ message: "<span class='loading'><img id='loadingGif' src='/images/ajax-loader.gif' alt='loading' /></span>" }); 
    });
    $("a[rel='external'] , a.external").click(function(){
          this.target = "_blank";
        });

  //  $("img").lazyload({ 
  //      // placeholder : "/javascripts/jquery_lazyload/img/grey.gif",
  //      // 	    effect : "fadeIn",
  //    	event : "mousewheeldown"
  //  
  //  });

});