class GalleriesController < ApplicationController
  before_filter :set_gallery_type
  def index
    @galleries=@gallery_type.galleries.where('enabled=?',true).order('event_date desc').group_by { |g| I18n.l(g.event_date,:format=>"%Y")  }
  end

  def show
    @gallery=@gallery_type.galleries.find(params[:id])
    
    @next=@gallery.next
    @previous=@gallery.previous
    
    #@photos=@gallery.photos.paginate :order=>'created_at', :page => params[:page],:per_page=>9
    @photos=@gallery.photos.all :order=>'position'
  end
  
  private
  def set_gallery_type
    @gallery_type=GalleryType.find(params[:photography_id])
    
  end
  
end
