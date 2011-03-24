class Location < ActiveRecord::Base
  has_many :galleries

  validates_presence_of :lat, :lng 
  acts_as_mappable 
  before_validation_on_create :geocode_address

  def long_label
    "#{self.name} <br />#{self.address}".html_safe
    
  end

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end  
  
  
  private
  def geocode_address 
    geo = GeoKit::Geocoders::MultiGeocoder.geocode(address) 
    errors.add(:address, "Could not geocode address") unless geo.success 
    self.lat, self.lng = geo.lat, geo.lng if geo.success
  end
end