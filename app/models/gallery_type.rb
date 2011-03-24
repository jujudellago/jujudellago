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
end
