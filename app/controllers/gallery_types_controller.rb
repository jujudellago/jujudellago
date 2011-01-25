class GalleryTypesController < ApplicationController
  def index
    @gallery_types=GalleryType.all
  end


end
