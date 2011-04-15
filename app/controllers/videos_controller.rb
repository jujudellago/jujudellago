class VideosController < ApplicationController
   respond_to :html,:js,:xml

    def index
      @page_title = 'Videos'
      @video=Video.find(Video.random_id)    
      @videos = Video.paginate :page => params[:page], :per_page=>20 ,:conditions=>['enabled=?',true]      
    end

    def show
    #  @page_title = 'View video'
      @video = Video.find params[:id]
    end
end




  
 
 