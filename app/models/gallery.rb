class Gallery < ActiveRecord::Base
  has_many :photos, :dependent => :destroy

  validates_presence_of :label_fr,:event_date
  belongs_to :gallery_type, :counter_cache => true
  belongs_to :location, :counter_cache => true

  translatable_columns :label, :description

  has_friendly_id :name, :use_slug => true  


  default_scope :order => 'event_date desc'


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


  def self.latest(i=6)
    self.where(:enabled=>true).limit(i).order(:created_at)
  end
  def self.next_galleries(gallery)
    where("event_date > ? and enabled=?", gallery.event_date,true).order('event_date').limit(5).all
  end 
  def self.previous_galleries(gallery)
    where("event_date < ? and enabled=?", gallery.event_date,true).order('event_date').limit(5).all
  end

  def date_label
    "#{event.start_date}"    
  end

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
  def display_date
    dt=created_at
    unless event_date.nil?
      dt=event_date
    end
    return I18n.l(dt,:format=>"%e %B %Y") 
  end

  
end




