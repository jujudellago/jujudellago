class Gallery < ActiveRecord::Base
  has_many :photos, :dependent => :destroy

  validates_presence_of :label_fr, :on => :create, :message => "can't be blank"
  belongs_to :gallery_type, :counter_cache => true
  belongs_to :location, :counter_cache => true

  translatable_columns :label, :description

  has_friendly_id :label_fr, :use_slug => true  


  def default_photo
    return nil if self.photos_count<1
    if self.default_photo_id.nil?
      self.photos[0]
    else
      Photo.find(self.default_photo_id)
    end
  end
  

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  

  
end




