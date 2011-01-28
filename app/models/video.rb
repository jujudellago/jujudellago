class Video < ActiveRecord::Base
  require 'youtube_it'
  before_save :get_datas
  validates_presence_of :source_url, :message => "can't be blank"
  



  def next
      v= self.class.find :first, :conditions => ["id > ?",self.id], :order => "id ASC"
      v= self.class.first if v.nil?
      return v
    end

    def previous
      v= self.class.find :first, :conditions => ["id < ?",self.id],:order => "id DESC"
      v= self.class.last if v.nil?
      return v
    end


    def self.random_id
      self.find(rand(self.count)).id      
    end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
      scoped
    end
  end
  
  def ttip
#    "<span class='big'>#{title}</span><hr /><strong>#{artist}</strong><i>#{year}</i><br />#{description}"
    "<span class='ttip_header'>#{title}</span><span class='ttip_content'>#{artist} :: #{year}</span><span class='ttip_content'>#{provider}</span>"
  end

  # def self.random
  #   self.where(rand(self.count))
  # end


   def get_datas
     tnurl="/images/no-image.jpg"
     if self.source_url.match(/(youtube.com*)/)
       vid=self.source_url.match(/=([A-Za-z0-9]*)/) ? self.source_url.match(/=([A-Za-z0-9\d_\-]*)/)[0].gsub(/=/,'') : self.source_url
       unless vid.nil?
         youtube_data=YouTubeIt::Client.new(:dev_key => YOUTUBE_API_KEY ).video_by(vid)
         self.title= self.title.blank? ? youtube_data.title : self.title
         self.description= self.description.blank? ? youtube_data.description  : self.description
         tnurl=youtube_data.thumbnails[0].url
         self.media_content_url=youtube_data.media_content[0].url
        end
        self.provider="youtube"
     elsif self.source_url.match(/(vimeo.com*)/)
        tnurl='/images/video/vimeo.png' 
        vid=self.source_url.match(/vimeo.com\/([^&]+)/)[1]
        unless vid.nil?
          vimeo_data=Vimeo::Simple::Video.info(vid)
          if vimeo_data && vimeo_data.size>0
            tnurl=vimeo_data[0]["thumbnail_medium"]
            self.title= self.title.blank? ? vimeo_data[0]["title"] : self.title
            self.description= self.description.blank? ? vimeo_data[0]["description"] : self.description
          end
        end

       #self.media_content_url="/videos/#{self.id}"


       self.media_content_url="http://www.vimeo.com/moogaloop.swf?clip_id=#{vid}&amp;server=www.vimeo.com&amp;fullscreen=1&amp;show_title=1&amp;show_byline=1&amp;show_portrait=0&amp;color="
       self.provider="vimeo"
    elsif self.source_url.match(/(dailymotion.com*)/)
       self.provider="dailymotion"      
       tnurl='/images/video/dailymotion.png' 
    elsif self.source_url.match(/(myspace.com*)/)
       self.provider="myspace"      
        tnurl='/images/video/myspace.png' 
    end

     self.thumbnail_url=tnurl
       
       
    end
end




