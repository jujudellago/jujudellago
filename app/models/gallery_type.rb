class GalleryType < ActiveRecord::Base
  has_many :galleries
  validates_presence_of :label_fr
  
    has_friendly_id :label_fr, :use_slug => true  

  
end
