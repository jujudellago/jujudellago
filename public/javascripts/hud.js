
/*
 * jQuery Nivo Slider v1.7
 * http://nivo.dev7studios.com
 *
 * Copyright 2010, Gilbert Pellegrom
 * Free to use and abuse under the MIT license.
 * http://www.opensource.org/licenses/mit-license.php
 * 
 * March 2010
 *
 * manualAdvance option added by HelloPablo (http://hellopablo.co.uk)
 */
//eval(function(p,a,c,k,e,d){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--){d[e(c)]=k[c]||e(c)}k=[function(e){return d[e]}];e=function(){return'\\w+'};c=1};while(c--){if(k[c]){p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c])}}return p}('(8($){$.1c.16=8(1O){9 5=$.22({},$.1c.16.1M,1O);O f.B(8(){9 4={e:0,h:\'\',1a:0,o:\'\',J:t,18:t,1J:t};9 3=$(f);3.1K(\'7:4\',4);3.c(\'24\',\'23\');3.q(\'1I\');3.s(\'1I\');3.1i(\'16\');9 d=3.21();d.B(8(){9 x=$(f);6(!x.I(\'N\')){6(x.I(\'a\')){x.1i(\'7-25\')}x=x.1A(\'N:1n\')}9 13=x.q();6(13==0)13=x.u(\'q\');9 11=x.s();6(11==0)11=x.u(\'s\');6(13>3.q()){3.q(13)}6(11>3.s()){3.s(11)}x.c(\'P\',\'1r\');4.1a++});6($(d[4.e]).I(\'N\')){4.h=$(d[4.e])}j{4.h=$(d[4.e]).1A(\'N:1n\')}6($(d[4.e]).I(\'a\')){$(d[4.e]).c(\'P\',\'1l\')}3.c(\'M\',\'R(\'+4.h.u(\'S\')+\') L-T\');1H(9 i=0;i<5.g;i++){9 A=1d.1X(3.q()/5.g);6(i==5.g-1){3.K($(\'<z C="7-b"></z>\').c({1R:(A*i)+\'Y\',q:(3.q()-(A*i))+\'Y\'}))}j{3.K($(\'<z C="7-b"></z>\').c({1R:(A*i)+\'Y\',q:A+\'Y\'}))}}3.K($(\'<z C="7-D"><p></p></z>\').c(\'P\',\'1r\'));6(4.h.u(\'12\')!=\'\'){$(\'.7-D p\',3).1p(4.h.u(\'12\'));$(\'.7-D\',3).1m(5.m)}9 r=0;6(!5.1b){r=1y(8(){H(3,d,5,t)},5.19)}6(5.U){3.K(\'<z C="7-U"><a C="7-1Y">20</a><a C="7-1P">27</a></z>\');6(5.1U){$(\'.7-U\',3).1S();3.1E(8(){$(\'.7-U\',3).26()},8(){$(\'.7-U\',3).1S()})}$(\'a.7-1Y\',3).1u(\'1t\',8(){6(4.J)O t;17(r);r=\'\';4.e-=2;H(3,d,5,\'1C\')});$(\'a.7-1P\',3).1u(\'1t\',8(){6(4.J)O t;17(r);r=\'\';H(3,d,5,\'1B\')})}6(5.E){9 1w=$(\'<z C="7-E"></z>\');3.K(1w);1H(9 i=0;i<d.1T;i++){1w.K(\'<a C="7-1F" 1G="\'+i+\'">\'+(i+1)+\'</a>\')}$(\'.7-E a:1W(\'+4.e+\')\',3).1i(\'1f\');$(\'.7-E a\',3).1u(\'1t\',8(){6(4.J)O t;6($(f).29(\'1f\'))O t;17(r);r=\'\';3.c(\'M\',\'R(\'+4.h.u(\'S\')+\') L-T\');4.e=$(f).u(\'1G\')-1;H(3,d,5,\'1F\')})}6(5.1D){3.1E(8(){4.18=Q;17(r);r=\'\'},8(){4.18=t;6(r==\'\'&&!5.1b){r=1y(8(){H(3,d,5,t)},5.19)}})}3.2i(\'7:V\',8(){4.J=t;$(d).B(8(){6($(f).I(\'a\')){$(f).c(\'P\',\'1r\')}});6($(d[4.e]).I(\'a\')){$(d[4.e]).c(\'P\',\'1l\')}6(r==\'\'&&!4.18&&!5.1b){r=1y(8(){H(3,d,5,t)},5.19)}5.1V.1L(f)})});8 H(3,d,5,1e){9 4=3.1K(\'7:4\');6(4.1J)O t;5.1N.1L(f);6(!1e){3.c(\'M\',\'R(\'+4.h.u(\'S\')+\') L-T\')}j{6(1e==\'1C\'){3.c(\'M\',\'R(\'+4.h.u(\'S\')+\') L-T\')}6(1e==\'1B\'){3.c(\'M\',\'R(\'+4.h.u(\'S\')+\') L-T\')}}4.e++;6(4.e==4.1a)4.e=0;6(4.e<0)4.e=(4.1a-1);6($(d[4.e]).I(\'N\')){4.h=$(d[4.e])}j{4.h=$(d[4.e]).1A(\'N:1n\')}6(5.E){$(\'.7-E a\',3).2j(\'1f\');$(\'.7-E a:1W(\'+4.e+\')\',3).1i(\'1f\')}6(4.h.u(\'12\')!=\'\'){6($(\'.7-D\',3).c(\'P\')==\'1l\'){$(\'.7-D p\',3).1Z(5.m,8(){$(f).1p(4.h.u(\'12\'));$(f).1m(5.m)})}j{$(\'.7-D p\',3).1p(4.h.u(\'12\'))}$(\'.7-D\',3).1m(5.m)}j{$(\'.7-D\',3).1Z(5.m)}9 i=0;$(\'.7-b\',3).B(8(){9 A=1d.1X(3.q()/5.g);$(f).c({s:\'G\',w:\'0\',M:\'R(\'+4.h.u(\'S\')+\') L-T -\'+((A+(i*A))-A)+\'Y 0%\'});i++});6(5.k==\'1q\'){9 1x=28 2h("1s","X","1v","W","1j","14","1z","1g");4.o=1x[1d.2f(1d.1q()*(1x.1T+1))];6(4.o==2a)4.o=\'1g\'}4.J=Q;6(5.k==\'2g\'||5.k==\'1s\'||4.o==\'1s\'||5.k==\'X\'||4.o==\'X\'){9 n=0;9 i=0;9 g=$(\'.7-b\',3);6(5.k==\'X\'||4.o==\'X\')g=$(\'.7-b\',3).10();g.B(8(){9 b=$(f);b.c(\'1k\',\'G\');6(i==5.g-1){F(8(){b.y({s:\'l%\',w:\'1.0\'},5.m,\'\',8(){3.Z(\'7:V\')})},(l+n))}j{F(8(){b.y({s:\'l%\',w:\'1.0\'},5.m)},(l+n))}n+=1h;i++})}j 6(5.k==\'2b\'||5.k==\'1v\'||4.o==\'1v\'||5.k==\'W\'||4.o==\'W\'){9 n=0;9 i=0;9 g=$(\'.7-b\',3);6(5.k==\'W\'||4.o==\'W\')g=$(\'.7-b\',3).10();g.B(8(){9 b=$(f);b.c(\'1Q\',\'G\');6(i==5.g-1){F(8(){b.y({s:\'l%\',w:\'1.0\'},5.m,\'\',8(){3.Z(\'7:V\')})},(l+n))}j{F(8(){b.y({s:\'l%\',w:\'1.0\'},5.m)},(l+n))}n+=1h;i++})}j 6(5.k==\'1j\'||5.k==\'2c\'||4.o==\'1j\'||5.k==\'14\'||4.o==\'14\'){9 n=0;9 i=0;9 v=0;9 g=$(\'.7-b\',3);6(5.k==\'14\'||4.o==\'14\')g=$(\'.7-b\',3).10();g.B(8(){9 b=$(f);6(i==0){b.c(\'1k\',\'G\');i++}j{b.c(\'1Q\',\'G\');i=0}6(v==5.g-1){F(8(){b.y({s:\'l%\',w:\'1.0\'},5.m,\'\',8(){3.Z(\'7:V\')})},(l+n))}j{F(8(){b.y({s:\'l%\',w:\'1.0\'},5.m)},(l+n))}n+=1h;v++})}j 6(5.k==\'1z\'||4.o==\'1z\'){9 n=0;9 i=0;$(\'.7-b\',3).B(8(){9 b=$(f);9 1o=b.q();b.c({1k:\'G\',s:\'l%\',q:\'G\'});6(i==5.g-1){F(8(){b.y({q:1o,w:\'1.0\'},5.m,\'\',8(){3.Z(\'7:V\')})},(l+n))}j{F(8(){b.y({q:1o,w:\'1.0\'},5.m)},(l+n))}n+=1h;i++})}j 6(5.k==\'1g\'||4.o==\'1g\'){9 i=0;$(\'.7-b\',3).B(8(){$(f).c(\'s\',\'l%\');6(i==5.g-1){$(f).y({w:\'1.0\'},(5.m*2),\'\',8(){3.Z(\'7:V\')})}j{$(f).y({w:\'1.0\'},(5.m*2))}i++})}}};$.1c.16.1M={k:\'1q\',g:15,m:2e,19:2d,U:Q,1U:Q,E:Q,1D:Q,1b:t,1N:8(){},1V:8(){}};$.1c.10=[].10})(2k);',62,145,'|||slider|vars|settings|if|nivo|function|var||slice|css|kids|currentSlide|this|slices|currentImage||else|effect|100|animSpeed|timeBuff|randAnim||width|timer|height|false|attr||opacity|child|animate|div|sliceWidth|each|class|caption|controlNav|setTimeout|0px|nivoRun|is|running|append|no|background|img|return|display|true|url|src|repeat|directionNav|animFinished|sliceUpLeft|sliceDownLeft|px|trigger|reverse|childHeight|title|childWidth|sliceUpDownLeft||nivoSlider|clearInterval|paused|pauseTime|totalSlides|manualAdvance|fn|Math|nudge|active|fade|50|addClass|sliceUpDown|top|block|fadeIn|first|origWidth|html|random|none|sliceDownRight|click|live|sliceUpRight|nivoControl|anims|setInterval|fold|find|next|prev|pauseOnHover|hover|control|rel|for|1px|stop|data|call|defaults|beforeChange|options|nextNav|bottom|left|hide|length|directionNavHide|afterChange|eq|round|prevNav|fadeOut|Prev|children|extend|relative|position|imageLink|show|Next|new|hasClass|undefined|sliceUp|sliceUpDownRight|3000|500|floor|sliceDown|Array|bind|removeClass|jQuery'.split('|'),0,{}));
// jTypeWriter, JQuery plugin
// v 1.1 
// Licensed under GPL licenses.
// Copyright (C) 2008 Nikos "DuMmWiaM" Kontis, info@dummwiam.com
// http://www.DuMmWiaM.com/jTypeWriter
// ----------------------------------------------------------------------------
;eval(function(p,a,c,k,e,r){e=function(c){return(c<a?'':e(parseInt(c/a)))+((c=c%a)>35?String.fromCharCode(c+29):c.toString(36))};if(!''.replace(/^/,String)){while(c--)r[e(c)]=k[c]||e(c);k=[function(e){return r[e]}];e=function(){return'\\w+'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('(7($){$.u.v=7(b){5 c,8,w,r,x,A;5 d=$.W({},$.u.v.H,b);5 e=d.I*J;5 f=d.K.X();5 g=d.L;5 h=d.M;5 j=d.9;5 k=d.N;5 l=d.O;5 m=(f=="Y")?" ":".";5 n=P Q();5 o=0;y(i=0;i<q.p;i++){4(j){$(q[i]).9(j)}4(f=="s")n.R({3:$(q[i]),6:$(q[i]).9()});t n.R({3:$(q[i]),6:$(q[i]).9().Z(m)});4(!g)o=n[i].6.p>o?n[i].6.p:o;t o+=n[i].6.p;$(q[i]).9("")}B();7 B(){c=e/o;8=0;w=r=0;x=(!g)?C(S,c):C(T,c)};7 S(){8++;y(i=0;i<n.p;i++){5 a=n[i];4(a.6.p>=8){4(f=="s"){a.3.9(a.6.U(0,8))}t{a.3.z(a.6[8-1]);4(8<o){a.3.z(m)}}}}4(8>=o){D()}};7 T(){$3=n[w];4(f=="s"){$3.3.9($3.6.U(0,++r))}t{$3.3.z($3.6[r++]);4(r<$3.6.p)$3.3.z(m)}4(r>=$3.6.p){w++;r=0}8++;4(8>=o){D()}};7 D(){E(x);4(f!="s"){}4(k){4(l)A=C(V,l*J);t F()}h()};7 F(){y(i=0;i<n.p;i++){n[i].3.9("")}B()};7 V(){F();E(A)};7 G(){E(x);y(i=0;i<n.p;i++){n[i].3.9(n[i].6)}};q.G=G;10 q};$.u.v.H={I:2,K:"s",L:11,M:7(){},9:"",N:12,O:0};$.u.v.13={14:P Q()}})(15);',62,68,'|||obj|if|var|initialText|function|nIntervalCounter|text||||||||||||||||length|this|nSequentialCounterInternal|letter|else|fn|jTypeWriter|nSequentialCounter|nInterval|for|append|nLoopInterval|init|setInterval|circleEnd|clearInterval|newLoop|endEffect|defaults|duration|1000|type|sequential|onComplete|loop|loopDelay|new|Array|push|typerSimultaneous|typerSequential|substr|loopInterval|extend|toLowerCase|word|split|return|true|false|variables|aObjects|jQuery'.split('|'),0,{}));

//MOLITOR SCRIPTS
;this.molitorscripts = function () {

	//REMOVE TITLE ATTRIBUTE
	jQuery("#dropmenu a").removeAttr("title");
		
	//PRETTY PHOTO
//   jQuery("a[href$='jpg'],a[href$='png'],a[href$='gif']").attr({rel: "prettyPhoto[pp_gal]"});
//   jQuery("a[rel^='prettyPhoto']").prettyPhoto({
//   			animationSpeed: 'normal', /* fast/slow/normal */
//   			padding: 40, /* padding for each side of the picture */
//   			opacity: 0.5, /* Value betwee 0 and 1 */
//   			showTitle: false, /* true/false */
//   			allowresize: true, /* true/false */
//   			counter_separator_label: ' of ', /* The separator for the gallery counter 1 "of" 2 */
//   			theme: 'dark_square', /* light_rounded / dark_rounded / light_square / dark_square */
//   			hideflash: true, /* Hides all the flash object on a page, set to TRUE if flash appears over prettyPhoto */
//   			modal: false /* If set to true, only the close button will close the window */
//   });
	
	$("a[rel='colorbox_slideshow']").colorbox({
		slideshow:true,
		slideshowSpeed:4000,
		slideshowAuto:false,
		slideshowStart:"Slideshow",
		slideshowStop:"Stop Slideshow"
	});
	
	//TOP BANNER and SOCIAL BUTTONS
	jQuery(".metaButton").css("opacity",.8).fadeIn(500);
		
	//FORM
	jQuery("#contactform #submit_btn").click(function() {  
		
		var normalborder = "1px solid #000",
			normalbackground = "#ccc",
			errorborder = "1px solid red",
			errorbackground = "#ffd3c9";  		
	    
	    jQuery("#contactform .input, #contactform textarea").css({border:normalborder, background:normalbackground});
	    		
		var name = jQuery("#contactform input#name");
		if (name.val() == "") {
			jQuery(name).focus().css({border:errorborder, background:errorbackground});
			return false;
		}
		var email = jQuery("#contactform input#email");
		if (email.val() == "") {
	      	jQuery(email).focus().css({border:errorborder, background:errorbackground});
	     	return false;
		}		
		var message = jQuery("#contactform textarea#message");
		if (message.val() == "") {
	      	jQuery(message).focus().css({border:errorborder, background:errorbackground});
	     	return false;
		}
	});
	
	//FADE IN DARK BACKGROUND
	jQuery("#formbackground").css("opacity",.7);
	jQuery(".metaButton").click(function(){
		jQuery("#formbackground").fadeIn();
	});
	//CONTACT FORM OPEN
	jQuery("#formOpen").click(function(){
		jQuery("#contactform").css({"left":"-50%","marginTop":-(jQuery("#contactform").outerHeight() / 2),"display":"inherit"}).animate({left:"50%"},300);
	});
	//SEARCH FORM OPEN
	jQuery("#searchOpen").click(function(){
		jQuery("#searching").css({"left":"-50%","marginTop":-(jQuery("#searching").outerHeight() / 2),"display":"inherit"}).animate({left:"50%"},300);
	});
	//LOGIN FORM OPEN
	jQuery("#loginOpen").click(function(){
		jQuery("#login").css({"left":"-50%","marginTop":-(jQuery("#login").outerHeight() / 2),"display":"inherit"}).animate({left:"50%"},300);
	});
	//FADE OUT ALL ITEMS
	jQuery(".close, #formbackground").click(function(){
		jQuery(".flyer").animate({left:"150%"},600).fadeOut();
		jQuery("#formbackground").fadeOut();
	});
	//CLOSE BUTTON EFFECT
	jQuery(".close").hover(function(){
		jQuery(this).removeClass("close").addClass("closeHover");
	},function(){
		jQuery(this).removeClass("closeHover").addClass("close");
	});	
	
	//GALLERY AND PORTFOLIO STYLES
	jQuery("body.category-gallery .postThumb,body.category-portfolio .postThumb").hover(function(){
		jQuery(this).stop().animate({opacity:.5},250);
	},function(){
		jQuery(this).stop().animate({opacity:1},250);
	});
	jQuery("body.category-gallery .post:nth-child(3n),body.category-portfolio .post:nth-child(3n)").addClass("third");
	jQuery("body.category-gallery .post h2.posttitle,body.category-portfolio .post h2.posttitle").css("opacity",.90);
	
	//FADE IN CONTENT
	jQuery("#content").fadeIn();

//SIZES FUNCTION
function sizes() {
		
	//HEIGHT AND MARGIN VARIABLES
	var contentheight = jQuery(window).height() - 200,
		topmargin = (contentheight / 2) + 20,
		content = jQuery("#content").outerHeight() / 2;
	
	//ADJUST SIDE ITEMS HEIGHT AND MARGIN
	jQuery("#sidebarScroll, #menuScroll").css("height",contentheight);
	jQuery("#sidebar, #menu").css({"marginTop": -topmargin});

	//IF CONTENT TOO LARGE...
	if(jQuery("#content").height() + 160 > jQuery(window).height()) {
		jQuery("#content").css({"marginTop": -topmargin});
		jQuery("#scrollContent").css("height",contentheight);
		//FOR THE SCROLL BAR SPACE
		jQuery("body.category-gallery #content,body.category-portfolio #content").addClass("small");
		jQuery("body.category-gallery .gallery_container .post,body.category-portfolio .post").addClass("smallPost");
		jQuery("body.category-gallery .gallery_container .post:nth-child(3n),body.category-portfolio .post:nth-child(3n)").addClass("smallThird");
		jQuery('#scrollContent').jScrollPane();
	} else {
		jQuery("#content").css({"marginTop": -content});
	}
	
	//IF SIDEBAR WIDGETS TOO LARGE...
	if(jQuery("#sidebarScroll").height() + 200 > jQuery(window).height()) {
		jQuery("#sidebarScroll").addClass("small");
	}
};

//RUN SIZES FUNCION
sizes();
//RUN AGAIN UPON WINDOW RESIZE
;jQuery(window).resize(function() {sizes();});
	
	//SIDEBAR STUFF
	jQuery("#sidebar").css({"opacity":.7}).toggle(1000);
	//HOVER
	jQuery("#sidebar").hoverIntent(function() {
		jQuery("#sidebarHint").stop(true,true).slideToggle();
		jQuery("#sidebar ul").stop(true,true).fadeIn();
		jQuery(this).css("borderColor","#ccc").stop().animate({right:"-1px",opacity:"1"},200)
		jQuery('#sidebarScroll').jScrollPane();
	},function(){
		jQuery("#sidebar ul").stop(true,true).fadeOut();
		jQuery("#sidebarHint").stop(true,true).slideToggle();
		jQuery(this).css("borderColor","#000").stop().animate({right:"-310px",opacity:".7"},500)
	});
	
	//MENU SIDEBAR STUFF
	jQuery("#menu").css({"opacity":.7}).toggle(1000);
	jQuery("#dropmenu ul").css("display","none").parent("li").prepend("<div class='openNav'>+</div><div class='closeNav'>-</div>");
	//CLICK
	jQuery(".openNav").click(function(){
		jQuery(this).parent().children("ul").slideDown("normal",menuCheck);
		jQuery(this).siblings(".closeNav").show()
		jQuery(this).css("display","none");
	});
	jQuery(".closeNav").click(function(){
		jQuery(this).parent().children("ul").slideUp("normal",menuCheck);
		jQuery(this).siblings(".openNav").show();
		jQuery(this).css("display","none");
	});
	//HOVER
	jQuery("#menu").hoverIntent(function() {
		jQuery("#menuHint").stop(true,true).slideToggle();
		jQuery("#dropmenu").stop(true,true).fadeIn();
		jQuery(this).css("borderColor","#ccc").stop().animate({left:"-1px",opacity:"1"},200);
	},function(){
		jQuery("#dropmenu").stop(true,true).fadeOut();
		jQuery("#menuHint").stop(true,true).slideToggle();
		jQuery(this).css("borderColor","#000").stop().animate({left:"-300px",opacity:".7"},500);
	});
	function menuCheck(){
		jQuery('#menuScroll').jScrollPane();
	}
	
	//FOOTER NEWS TICKER
	jQuery('.fadein').fadeIn(500).innerfade({
			animationtype: 'fade',
			speed: 750,
			timeout: 7000,
			type: 'sequence'
	});
	
	//LOADING IMAGE
	jQuery("#loadingGif").fadeOut(1000);
	
};
//END MYSCRIPTS
//jQuery.noConflict(); 


jQuery(document).ready(function(){molitorscripts(); tooltip();  });