#/vimeo.com\/([^&]+)/
#
#
#
#
#     self.match(/[A-Za-z\d_\-\.+]+@[A-Za-z\d_\-\.]+\.[A-Za-z\d_\-]+/)[0]
#     
#     
#     "http://www.youtube.com/v/OMsCoQ_eynk?fs=1&h
#     
#     
#     
#     
#     
#     .match(/www.youtube.com\/v\/([^&]+)/)
#     
#     
#     
#     
#     .embeded.match(/www.youtube.com\/v\/([^&]+)?/)[1]
#     .embeded.match(/www.youtube.com\/v\/([A-Za-z\d_\-\.+]+)?/)[1]
     
#     .embeded.match(/www.youtube.com\/watch?v=([A-Za-z\d_\-\.+]+)?/)
     
#     http://www.youtube-nocookie.com/v/sh9JVRNF0yg&hl=fr&fs=1&border=1
#    s.match(/www.youtube-nocookie.com\/v\/([A-Za-z\d_\-\.+]+)?/)
# s.match(/vimeo.com\/([^&]+)/)

#  s.match(/vimeo.com\/video\/([A-Za-z\d_\-\.+]+)/)[1]
#  w_byline=1&amp;show_portrait=0&amp;color=&amp;fullscreen=1\" /><embed src=\"http://vimeo.com/moogaloop.swf?clip_id=4724781
# s.match(/clip_id=([A-Za-z0-9]*)/)   
# "http://mediaservices.myspace.com/services/media/embed.aspx/m=16654543,t=1,mt=video,searchID=,primarycolor=,secondarycolor=
# http://www.myspace.com/nexthrash/videos/video/107364463
# http://www.myspace.com/video/vid/107364463

# http://www.myspace.com/video/vid/16654543
# <object width="425px" height="360px" ><param name="allowScriptAccess" value="always"/><param name="allowFullScreen" value="true"/><param name="wmode" value="transparent"/><param name="movie" value="http://mediaservices.myspace.com/services/media/embed.aspx/m=16654543,t=1,mt=video"/><embed src="http://mediaservices.myspace.com/services/media/embed.aspx/m=16654543,t=1,mt=video" width="425" height="360" allowFullScreen="true" type="application/x-shockwave-flash" wmode="transparent" allowScriptAccess="always"></embed></object>
s.match(/m=([A-Za-z0-9]*)/) 
  
       s= LegacyVideo.find(72).embeded
     
    s= LegacyVideo.find(6).embeded
     
     # http://www.youtube.com/watch?v=mq7x3gHrNPE
     # http://www.vimeo.com/2693546
     
     s.match(/dailymotion.com\/swf\/([A-Za-z0-9\-\_]+)/)[1] 
     
     
     s.match(/dailymotion.com\/video\/([^&]+)/)[1].split("_")[0]     
     id = $1.split("_")[0]
     
     

     LegacyVideo.all.each do |vid|
       surl=""
       if vid.embeded.match(/(youtube.com*)/) || vid.embeded.match(/(youtube-nocookie.com*)/)      
         if vid.embeded.extract_youtube_id
           surl="http://www.youtube.com/watch?v=#{vid.embeded.extract_youtube_id}"
           #  puts "#{vid.id} is a youtube video with id of #{vid.embeded.extract_youtube_id} "
         else
           puts "#{vid.id} is NOT a youtube video ERROR"
         end
       elsif vid.embeded.match(/(facebook.com*)/)      
         puts "#{vid.id} is a facebok video "

       elsif vid.embeded.match(/(myspace.com*)/)
         puts "#{vid.id} is a myspace video "
       elsif vid.embeded.match(/(dailymotion.com*)/)
         puts "#{vid.id} is a dailymotion video "
       elsif vid.embeded.match(/(vimeo.com*)/)
         surl="http://www.vimeo.com/#{vid.embeded.extract_vimeo_id}"
         # puts "#{vid.id} is a vimeo video with id of #{vid.embeded.extract_vimeo_id}"
       else
         puts "what the fuck is this #{vid.id} ??"
       end
         unless source_url.nil?
            puts "XXXX create new video  #{source_url}"
        #  end
     end
     
     

      
      
      
      t.integer :id_party
      t.string :artist
      t.string :title
      t.string :year
      t.text :description
      t.text :embeded
      t.string :image_path
      t.integer :vote_count
      t.integer :play_count
      t.integer :comment_count
      t.integer :nb_sort_order
      
      
      
      
      
      create_table "videos", :force => true do |t|
        t.string   "source_url"
        t.string   "title"
        t.string   "artist"
        t.string   "year"
        t.string   "icon_file_name"
        t.string   "icon_content_type"
        t.integer  "icon_file_size"
        t.string   "thumbnail_url"
        t.string   "media_content_url"
        t.boolean  "enabled",           :default => false
        t.text     "description"
        t.datetime "created_at"
        t.datetime "updated_at"
      end
       
     
      
      
      LegacyVideo.find(6)
      
      
      <font face="Verdana" size="1" color="#999999"><br/>
      <a href="http://www.myspace.com/video/vid/107364320" style="font: Verdana">Bruce Cradle Band Trailer B</a><br/>
      <object width="425px" height="360px" ><param name="allowScriptAccess" value="always"/>
      <param name="allowFullScreen" value="true"/><param name="wmode" value="transparent"/>
      <param name="movie" value="http://mediaservices.myspace.com/services/media/embed.aspx/m=107364320,t=1,mt=video"/>
      <embed src="http://mediaservices.myspace.com/services/media/embed.aspx/m=107364320,t=1,mt=video" width="425" height="360" 
      allowFullScreen="true" type="application/x-shockwave-flash" wmode="transparent" allowScriptAccess="always"></embed>
      </object><br/><a href="http://www.myspace.com/324689770" style="font: Verdana">Roger Büchel</a> |
       <a href="http://www.myspace.com/video" style="font: Verdana">Myspace Video</a></font>