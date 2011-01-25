class Category < ActiveRecord::Base
  has_many :articles, :dependent => :nullify
  validates_length_of :name, :maximum => 80
  validates_presence_of :name
  acts_as_tree_with_dotted_ids :order => "name"
  has_friendly_id :name, :use_slug => true  
  translatable_columns :label


   
  def formatted_name
    fname=self.parent ? self.parent.label+" :: "+self.label  : self.label
    return fname
  end
  
  named_scope :all_parents, :conditions => {:parent_id=>0}

  def display_name
    label
  end

  def self.all_cached
    Rails.cache.fetch('Category.all') { all }
  end
  
  def self.all_parent_cached
    Rails.cache.fetch('Category.all_parents') { all_parents }
  end

  def images_full?
   false 
    #self.infolinks.find(:all,:joins=>:infolink_type,:order=>'infolink_types.position',:conditions=>{:infolink_type_id=>2}).size>2
  end

  

end
