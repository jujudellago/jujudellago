class GalleryType < ActiveRecord::Base
  has_many :galleries
  validates_presence_of :name, :label_fr
  
    has_friendly_id :name, :use_slug => true  

    def self.search(search)
      if search
        where('name LIKE ?', "%#{search}%")
      else
        scoped
      end
    end
    
    
    def random_image
      ar=self.galleries.collect(&:id)
      gallery=Gallery.find(ar[rand(ar.size)])
      return gallery.default_photo.image.url
      #pt=gallery.photos.collect(&:id)
      #return Photo.find(pt[rand(pt.size)]).image.url
      
      
    end
    
end
