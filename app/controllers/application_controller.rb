class ApplicationController < ActionController::Base
  protect_from_forgery

   before_filter :set_locale
   def default_url_options(options={})
       #logger.debug "default_url_options is passed options: #{options.inspect}\n"
       { :locale => I18n.locale }
    end
     

   private
   def set_locale
      I18n.locale = params[:locale]
      params.delete(:locale)
   end

   def call_rake(task, options = {})
     options[:rails_env] ||=  RAILS_ENV
     args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
     cmd= "rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
     logger.debug("call_rake will exec: #{cmd}")
     system cmd
   end

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
   def url_encode
     self.gsub(/ /,'%20').gsub(/&/,'&amp;')
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


   # &egrave; è
   # &eacute; é
   # &ecirc; ê
   # &agrave; à
   # &uuml; ü
   # &auml;  ä

end