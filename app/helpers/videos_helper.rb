module VideosHelper
  def video_embed_code(video, options={})
    options[:width]  ||= "640"
    options[:height] ||= "420"
    options[:big] ||=false
    options[:color1] ||="cccccc"
    options[:color2] ||="efefef"
    #<object height="380" width="630">



    case video.source_url
    when /youtube/
      #video.source_url =~ /v=([^&]+)/
      #id = $1
      id=video.source_url.extract_youtube_id

        if options[:html5]
           <<-EOS
          <iframe class="youtube-player" type="text/html" width="#{options[:width]}" height="#{options[:height]}" src="http://www.youtube.com/embed/#{id}" frameborder="0">
          </iframe>
          EOS
        else
              #fullUrl="http://www.youtube.com/v/#{id}&amp;ap=%2526fmt%3D22&amp;fs=1&amp;showinfo=0&amp;color1=#{options[:color1]}&amp;color2=#{options[:color2]}&amp;border=0&amp;rel=0&amp;showsearch=0"
              fullUrl="http://www.youtube.com/v/#{id}&amp;fs=1&amp;showinfo=0&amp;color1=#{options[:color1]}&amp;color2=#{options[:color2]}&amp;showsearch=0&amp;rel=0"
                   <<-EOS
                   <object width="#{options[:width]}" height="#{options[:height]}">
                   <param name="movie" value="#{fullUrl}" ></param>
                   <param value="window" name="wmode"></param>
                   <param value="true" name="allowFullScreen">
                   <param value="always" name="allowscriptaccess">
                   <embed width="#{options[:width]}" height="#{options[:height]}" wmode="window" allowfullscreen="true" type="application/x-shockwave-flash" src="#{fullUrl}">
                   </embed></param>
                   </object>   
                   EOS

          
        end
     
    when /vimeo/
     # video.source_url =~ /vimeo.com\/([^&]+)/
    #  id = $1
     id=video.source_url.extract_vimeo_id 
      if options[:html5]
        <<-EOS
        <iframe src="http://player.vimeo.com/video/#{id}" width='#{options[:width]}' height='#{options[:height]}' frameborder="0"></iframe>
        EOS
      else
      <<-EOS
      <object type="application/x-shockwave-flash" width="#{options[:width]}" height="#{options[:height]}" data="http://www.vimeo.com/moogaloop.swf?clip_id=#{id}&amp;server=www.vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=">
      <param name="quality" value="best" />
      <param name="allowfullscreen" value="true" />
      <param name="scale" value="showAll" />
      <param name="movie" value="http://www.vimeo.com/moogaloop.swf?clip_id=#{id}&amp;server=www.vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color=" />
      </object>
      EOS
      end
   when /myspace/
        id=video.source_url.extract_myspace_id   
         <<-EOS
         <object width="#{options[:width]}px" height="#{options[:height]}px" >
          <param name="allowScriptAccess" value="always"/>
          <param name="allowFullScreen" value="true"/>
          <param name="wmode" value="transparent"/>
          <param name="movie" value="http://mediaservices.myspace.com/services/media/embed.aspx/m=#{id},t=1,mt=video"/>
          <embed src="http://mediaservices.myspace.com/services/media/embed.aspx/m=#{id},t=1,mt=video" width="#{options[:width]}" height="#{options[:height]}" allowFullScreen="true" type="application/x-shockwave-flash" wmode="transparent" allowScriptAccess="always"></embed>
          </object>
         EOS
    when /dailymotion/
     # video.source_url =~ /dailymotion.com\/video\/([^&]+)/
    #  id = $1.split("_")[0]
      id=video.source_url.extract_dailymotion_id
      <<-EOS
        <iframe frameborder="0" width="#{options[:width]}" height="#{options[:height]}" src="http://www.dailymotion.com/embed/video/#{id}?width=&theme=none&foreground=%23F7FFFD&highlight=%23FFC300&background=%23171D1B&start=&animatedTitle=&iframe=1&additionalInfos=0&autoPlay=0&hideInfos=0"></iframe>
      EOS
    else
      "El servicio de video usado no está soportado aun por el sistema o la url es incorrecta."
    end
  end
end