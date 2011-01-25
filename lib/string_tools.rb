module StringTools
end
class String
  def cleanup_html
    return "#{self.gsub(/<[a-zA-Z\/][^>]*>/){}}"
  end
   def extract_email
    self.match(/[A-Za-z\d_\-\.+]+@[A-Za-z\d_\-\.]+\.[A-Za-z\d_\-]+/)[0]
   rescue NoMethodError
     nil
   end
   def clean_amp
      self.gsub(/&(?!amp;)/,'&amp;')
   end
   def safe_email
     self.gsub(/@/, '[at]').gsub(/\./,'[dot]') 
   end

   def get_file_extension
     h=self.split(".")
     return h[h.size-1]
   end

   def truncate(length = 30, end_string = ' …')
     return "" if self.nil?
      words = self.split()
      return words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
    end

    def word_count
      return self.split().size()
    end

    def extract_youtube_id
      m1=nil
      m2=nil
      m3=nil
      
      if self.match(/(youtube.com*)/)     
        m1=self.match(/www.youtube.com\/v\/([A-Za-z\_\d_\-\.+]+)?/)
        m2=self.match(/=([A-Za-z0-9\-\_]*)/)
      else
        m3=self.match(/www.youtube-nocookie.com\/v\/([A-Za-z\d_\-\.+]+)?/)
      end
       if m1
         return m1[1]
       elsif m2
         return m2[1]
       elsif m3
         return m3[1]
       end
      
    rescue NoMethodError
       nil
    end
    
    def extract_myspace_id
      if self.match("/video/vid/")
        self.match(/\/video\/vid\/([A-Za-z0-9\-\_]+)/)[1]
      else
        self.match(/m=([A-Za-z0-9]*)/)[1]
      end
     rescue NoMethodError
           nil
    end
    
    def extract_dailymotion_id
      if self.match("/swf/video/")
         self.match(/dailymotion.com\/swf\/video\/([A-Za-z0-9\-\_]+)/)[1]
      elsif self.match("/swf")
         self.match(/dailymotion.com\/swf\/([A-Za-z0-9\-\_]+)/)[1]
      else
         self.match(/dailymotion.com\/video\/([^&]+)/)[1].split("_")[0]     
      end
        rescue NoMethodError
           nil
    end
    
    def extract_vimeo_id
      if self.match(/(moogaloop.swf)/)
        return self.match(/clip_id=([A-Za-z0-9]*)/)[1]
      elsif self.match(/vimeo.com\/video/)
        return self.match(/vimeo.com\/video\/([A-Za-z\d_\-\.+]+)/)[1]
      else
        return self.match(/vimeo.com\/([A-Za-z\d_\-\.+]+)/)[1]
      end
      rescue NoMethodError
         nil
    end
    

   # &egrave; è
   # &eacute; é
   # &ecirc; ê
   # &agrave; à
   # &uuml; ü
   # &auml;  ä

 end