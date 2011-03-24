module GoogleHelper

  def google_add(size="728-90")
    gadds=""
    if size=="728-90"
      if is_devel_mode?
        gadds<<image_tag('/images/pub/728-90.gif') 
      else  
      gadds<< %(
        <script type="text/javascript"><!--
			    google_ad_client = "pub-9209840558105246";
			    /* 728x90, date de création 06/06/08 */
			    google_ad_slot = "5898003850";
			    google_ad_width = 728;
			    google_ad_height = 90;
			    //-->
			    </script>
			    <script type="text/javascript"
			    src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
			    </script>
      )
      end
    elsif size=="600-160"
      gadds<< %(
      <script type="text/javascript"><!--
      google_ad_client = "pub-9209840558105246";
      /* 160x600, date de création 06/02/09 */
      google_ad_slot = "0363084692";
      google_ad_width = 160;
      google_ad_height = 600;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
      )
    elsif size=="468x15"
      gadds<<%(
      <script type="text/javascript"><!--
      google_ad_client = "pub-9209840558105246";
      /* 468x15, date de création 20/01/09 */
      google_ad_slot = "7276458451";
      google_ad_width = 468;
      google_ad_height = 15;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
      )
    elsif size=="300-250"
      if is_devel_mode?
          gadds<<image_tag('/images/pub/300x250_img.jpg ') 
        else
      gadds<< %(
      <script type="text/javascript"><!--
      google_ad_client = "pub-9209840558105246";
      /* 300x250, date de création 04/09/08 */
      google_ad_slot = "5939622896";
      google_ad_width = 300;
      google_ad_height = 250;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
      )  
      end
      elsif size=="300-250-img"
      gadds<< %(
      <script type="text/javascript"><!--
      google_ad_client = "pub-9209840558105246";
      /* 300x250 IMAGES , date de création 28/02/09 */
      google_ad_slot = "9610630583";
      google_ad_width = 300;
      google_ad_height = 250;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
      ) 

    elsif size=="120-90"
      gadds<< %(
      <script type="text/javascript"><!--
      google_ad_client = "pub-9209840558105246";
      /* 120x90, date de création 03/10/08 */
      google_ad_slot = "6416801832";
      google_ad_width = 120;
      google_ad_height = 90;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
      )
    elsif size=="120x240"
       if is_devel_mode?
          gadds<<image_tag('/images/pub/gadds_120-240.png') 
        else
         gadds<< %(
        <script type="text/javascript"><!--
        google_ad_client = "pub-9209840558105246";
        /* 120x240, date de création 03/10/08 */
        google_ad_slot = "4994844668";
        google_ad_width = 120;
        google_ad_height = 240;
        //-->
        </script>
        <script type="text/javascript"
        src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
        </script>
      )      
    end
      
    elsif size=="200-200"
      if is_devel_mode?
          gadds<<image_tag('/images/pub/200x200.jpg') 
      else
      gadds<< %(
      <script type="text/javascript"><!--
      google_ad_client = "pub-9209840558105246";
      /* 200x200, date de création 06/06/08 */
      google_ad_slot = "6306201390";
      google_ad_width = 200;
      google_ad_height = 200;
      //-->
      </script>
      <script type="text/javascript"
      src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
      </script>
      )
      end
       elsif size=="250-250"
          if is_devel_mode?
              gadds<<image_tag('/images/pub/video250x250.gif') 
          else
          gadds<< %(
          <script type="text/javascript"><!--
          google_ad_client = "pub-9209840558105246";
          /* 250x250, date de création 28/04/09 */
          google_ad_slot = "8156192718";
          google_ad_width = 250;
          google_ad_height = 250;
          //-->
          </script>
          <script type="text/javascript"
          src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
          </script>
          )
          end
    elsif size=="728x15"
    gadds<< %(
    <script type="text/javascript"><!--
    google_ad_client = "pub-9209840558105246";
    /* 728x15, date de création 28/02/09 */
    google_ad_slot = "2872500212";
    google_ad_width = 728;
    google_ad_height = 15;
    //-->
    </script>
    <script type="text/javascript"
    src="http://pagead2.googlesyndication.com/pagead/show_ads.js">
    </script>
     )
    end
    return gadds.html_safe
  end

  def beatport_squares(locale)
    bpadds=""
    use_beatport=false
    if  false #is_devel_mode?
      bpadds<< %(
      <a href=#><img alt="Beatport LLC" src="/images/pub/iuse_girl_bannerad_125x125.gif" /></a><img border="0" width="1" alt="" height="1" src="/images/s.gif" />
      <br clas="clear">                                                                                                                              
      <a href="#"><img alt="cede.ch"   src="/images/pub/1_cede_120x60.gif" /></a><img border="0" width="1" alt="" height="1" src="/images/s.gif" />	
      <br clas="clear"><br clas="clear">          
      )
    else
      if use_beatport
      
          if locale.nil?
            bpadds<< %(
            <a href="http://click.linksynergy.com/fs-bin/click?id=0wHG*IVfMBc&amp;offerid=129987.10000009&amp;type=4&amp;subid=0"><img alt="Beatport LLC"  src="http://marketing.beatport.com/banners/linkshare/ads/iuse_girl_bannerad_125x125.gif" /></a><img border="0" width="1" alt="" height="1" src="http://ad.linksynergy.com/fs-bin/show?id=0wHG*IVfMBc&amp;bids=129987.10000009&amp;type=4&amp;subid=0" />
            )
          else
            if locale=="fr"
              bpadds<< %(
              <a href="http://click.linksynergy.com/fs-bin/click?id=0wHG*IVfMBc&amp;offerid=129987.10000461&amp;type=4&amp;subid=0"><img alt="Beatport LLC"  src="http://marketing.beatport.com/banners/linkshare/language/beatport_french_125x125banner.gif" /></a><img border="0" alt="" width="1" height="1" src="http://ad.linksynergy.com/fs-bin/show?id=0wHG*IVfMBc&amp;bids=129987.10000461&amp;type=4&amp;subid=0" />
              )
            elsif locale=="de"
              bpadds<< %(
              <a href="http://click.linksynergy.com/fs-bin/click?id=0wHG*IVfMBc&amp;offerid=129987.10000466&amp;type=4&amp;subid=0"><img alt="Beatport LLC"  src="http://marketing.beatport.com/banners/linkshare/language/beatport_german_125x125banner.gif" /></a><img border="0" alt="" width="1" height="1" src="http://ad.linksynergy.com/fs-bin/show?id=0wHG*IVfMBc&amp;bids=129987.10000466&amp;type=4&amp;subid=0" />
              )
            else
              bpadds<< %(
              <a href="http://click.linksynergy.com/fs-bin/click?id=0wHG*IVfMBc&amp;offerid=129987.10000009&amp;type=4&amp;subid=0"><img alt="Beatport LLC"  src="http://marketing.beatport.com/banners/linkshare/ads/iuse_girl_bannerad_125x125.gif" /></a><img border="0" width="1" alt="" height="1" src="http://ad.linksynergy.com/fs-bin/show?id=0wHG*IVfMBc&amp;bids=129987.10000009&amp;type=4&amp;subid=0" />
              )
            end
          end
    else
      #itunes
   #   if locale=="fr"
   #       bpadds<<%(
   #       <script type="text/javascript">
   #       var uri = 'http://impch.tradedoubler.com/imp?type(js)g(17101052)a(1574468)' + new String (Math.random()).substring (2, 11);
   #       document.write('<sc'+'ript type="text/javascript" src="'+uri+'" charset="ISO-8859-1"></sc'+'ript>');
   #       </script>
   #     
   #       )
   #    elsif locale=="de"
   #       bpadds<<%(
   #         <script type="text/javascript">
   #         var uri = 'http://impch.tradedoubler.com/imp?type(js)g(17100812)a(1574468)' + new String (Math.random()).substring (2, 11);
   #         document.write('<sc'+'ript type="text/javascript" src="'+uri+'" charset="ISO-8859-1"></sc'+'ript>');
   #         </script>
   #       )
      # else
      
      #itunes
         bpadds<<%(
         <script type="text/javascript">
         var uri = 'http://impch.tradedoubler.com/imp?type(img)g(16226026)a(1574468)' + new String (Math.random()).substring (2, 11);
         document.write('<a href="http://clk.tradedoubler.com/click?p=24372&a=1574468&g=16226026" target="_BLANK"><img src="'+uri+'" border=0></a>');
         </script>
         <br class="clear"/>
         
         )
     #  end
         
         # jamba
          bpadds<<%(
         <br clas="clear">     
          <script type="text/javascript">
          var uri = 'http://impch.tradedoubler.com/imp?type(img)g(634257)a(1574468)' + new String (Math.random()).substring (2, 11);
          document.write('<a href="http://clk.tradedoubler.com/click?p=19921&a=1574468&g=634257" target="_BLANK"><img src="'+uri+'" border=0></a>');
          </script>
          )
      end
     # bpadds<< %(
     # <br clas="clear">                                                                                                                              
     #   <a href="http://click.linksynergy.com/fs-bin/click?id=0wHG*IVfMBc&amp;offerid=129987.10000437&amp;type=4&amp;subid=0"><img alt="Beatport LLC"      src="http://marketing.beatsource.com/banners/linkshare/logos/bs_generic_125x125.gif" /></a><img border="0" width="1" alt="" height="1" src="http://ad.linksynergy.com/fs-bin/show?id=0wHG*IVfMBc&amp;bids=129987.10000437&amp;type=4&amp;subid=0" />	
     # )
     #cede.ch
      bpadds<< %(
      <br clas="clear">                                                                                                                              
         <a href="http://www.cede.ch/fr/partner.cfm?pid=1128" target="_blank"><img alt="Cede.ch" src="http://www.cede.ch/fr/logo/1_cede_120x60.gif" /></a>	
       )
      
    end
    return bpadds.html_safe
  end

  def banner_600_160(locale)
    ban=""
    if  is_devel_mode?
      ban<<image_tag("/pubs/cd_audio.png")
    else
      #avalanches
    #  ban<< %(
    #	   <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="160" height="600"><param name="movie" value="/pubs/avalanche_festival.swf"><param name="quality" value="high"><embed src="/pubs/avalanche_festival.swf"quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="160" height="600"></embed></object>      
    #   )
     
      
      
      # cd-audio.ch
     if locale.nil?
       ban<< %(
   	   <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="160" height="600"><param name="movie" value="/pubs/banner_cdaudio_<%= Locale.language.code %>.swf"><param name="quality" value="high"><embed src="/pubs/banner_cdaudio_en.swf"quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="160" height="600"></embed></object>
       )
     else
       ban<< %(
   	   <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="160" height="600"><param name="movie" value="/pubs/banner_cdaudio_#{locale}.swf"><param name="quality" value="high"><embed src="/pubs/banner_cdaudio_#{locale}.swf"quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="160" height="600"></embed></object>      
       )
     end
      
      
      
      
 # ban<< %(
 # 		<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="160" height="600"><param name="movie" value="/pubs/160x600_stgermain.swf"><param name="quality" value="high"><embed src="/pubs/160x600_stgermain.swf"quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="160" height="600"></embed></object>
 # )
    
      end
    return ban.html_safe
  end



  def banner_728_90(locale)
    if locale.downcase=="de"
      ban=link_to(image_tag("/pubs/SwissTrack_Banner_de.jpg",:border=>0),"http://www.streetparade.com/08/de/2008.php")
    else
      ban=link_to(image_tag("/pubs/SwissTrack_Banner_fr.jpg",:border=>0),"http://www.streetparade.com/08/fr/2008.php")
    end
    return ban.html_safe
  end


  def google_map(label,lat,lng,sensor=false)
    ss=sensor.to_s
    #retjs=javascript_include_tag("http://maps.google.com/maps/api/js?sensor=#{ss}")
    
    #retjs=javascript_tag('google.load("maps", "3", {other_params:"sensor=false;callback=loadMyMap"});')
   # http://maps.google.com/maps/api/js?sensor=false&callback={myInitFunction}
  #  retjs<<javascript_include_tag("smartinfowindow")
  
  retjs=""
  
  
    retjs<< %(
    <script type="text/javascript" >
    //<![CDATA[
      src="http://maps.google.com/maps/api/js?sensor=false&callback=loadMyMap";
      window.google = window.google || {};
      google.maps = google.maps || {};
      $(function() {
        
         $('#gmap_full img#static_image').live("click",function(e){
             //alert("getScript="+src);
             getScript(src);
         });
        
        function getScript(src) {
          var s = document.createElement('script');
          s.src = src;
          //alert("getScript="+s);
          document.body.appendChild(s);
        }
        //getScript(src);
        $('#map_trigger a').live("click",function(e){
            e.preventDefault();
            getScript(src);
            $('#map_container').slideToggle("slow");
        });
      });

        
      function loadMyMap(){
        var bubble = $('#info_bubble').html();
        //alert("loadMyMap="+bubble);
        var latlng = new google.maps.LatLng(#{(lat)}, #{lng});
        var myOptions = {
          zoom: 15,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("gmap_full"),myOptions);
        

        
        var markerOptions ={map: map, position: new google.maps.LatLng(#{lat}, #{lng})};
        var marker = new google.maps.Marker(markerOptions);
        var infowindow = new google.maps.InfoWindow({
             content: bubble
         });
         //google.maps.event.addListener(marker, 'click', function() {
           infowindow.open(map,marker);
        // });
        

         
          
      };
    //]]>
    </script>
    ).html_safe
    content_for(:head_js) {retjs.html_safe}
    
    
     ret=""
      #h=HtmlUtils::Htmlbox.new(self)
      #h.all_width("_all")
      #h.set_icon_img("google")
      #h.set_header("#{"Google map for"}  #{object.display_name}")
      #h.set_div_id("search_map_control")
      #   h.set_loader_id("search_map_control_loader")
      #  h.set_wait_loading_message("Loading")
      
      
      #ret<<h.sub_box_title
      # <h4 id="map_trigger"><a href="#">#{"Google map for"}  #{object.display_name}</a></h4>
      
      ret<<%(
          <div id="map_container">
            <div class="block">
            <div id="gmap_full" class="box ic_container">
              #{image_tag("http://maps.google.com/maps/api/staticmap?center=#{lat},#{lng}&zoom=14&size=300x240&markers=color:red%7Ccolor:red%7Clabel:C%7C#{lat},#{lng}&sensor=false",:id=>'static_image')}
              <div class="overlay" style=""></div>
              <div class="img_caption">
                  <p class="text_caption">Click on the map to load the interactive features from google</p>
              </div>
            </div>
          </div>
      </div>
      <div id="info_bubble">#{label}</div>
      )
      
     # ret<<retjs.html_safe
      return ret.html_safe
  end

  



end