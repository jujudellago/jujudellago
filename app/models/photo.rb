class Photo < ActiveRecord::Base
  belongs_to :gallery, :counter_cache => true
  validates_uniqueness_of :image_file_name,  :message => "this file already exists in the gallery", :scope=>:gallery_id
 
  before_destroy :unset_default_id
  acts_as_list :scope => :gallery


  # Paperclip
    # http://www.thoughtbot.com/projects/paperclip
    has_attached_file :image,
    :styles => {
          :tiny=>'64x64#',
          :thumb=> "160x",
          :large => "900x600",
          :small  => "220x160#"},
          :path => ":rails_root/public/galleries/:attachment/:id/:style/:basename.:extension",
          :url => "/galleries/:attachment/:id/:style/:basename.:extension"
   #  :storage => :s3,
   #  :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
   #  :url => ':s3_domain_url',
   #  :path => "galleries/:attachment/:id/:style/:basename.:extension"
    
      

    # Paperclip Validations
    validates_attachment_presence :image
    validates_attachment_content_type :image, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif']


    def unset_default_id
        self.gallery.default_photo_id=nil
        self.gallery.save
    end


end



