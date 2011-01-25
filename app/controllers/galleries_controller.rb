class GalleriesController < ApplicationController
  before_filter :set_gallery_type
  def index
    @galleries=@gallery_type.galleries.where('enabled=?',true)
  end

  def show
    @gallery=@gallery_type.galleries.find(params[:id])
    #@photos=@gallery.photos.paginate :order=>'created_at', :page => params[:page],:per_page=>9
    @photos=@gallery.photos.all :order=>'created_at'
  end
  
  private
  def set_gallery_type
    @gallery_type=GalleryType.find(params[:gallery_type_id])
    
  end
  
end
