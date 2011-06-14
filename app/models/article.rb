class Article < ActiveRecord::Base
  belongs_to :category , :counter_cache=>true
  
 
  validates_presence_of  :title_fr
  validates_length_of :title_fr, :maximum => 255
  has_friendly_id :title_fr, :use_slug => true  


  before_save :update_published_at_and_permalink
  acts_as_taggable
  


  acts_as_indexed :fields =>[:intro_fr, :body_fr,:intro_en,:body_en]
   

    translatable_columns :title, :intro, :body
  
  # Paperclip
    # http://www.thoughtbot.com/projects/paperclip
    has_attached_file :icon,
#    :path => ":rails_root/public/galleries/:attachment/:id/:style/:basename.:extension",
    :styles => {
           :tiny =>'64x64>',
           :thumb=> "160x",
           :small  => "220x160#",
           :large => "600x600>"},
     :storage => :s3,
     :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
      :url => ':s3_domain_url',
      :path => "articles/:attachment/:id/:style/:basename.:extension"
    
      

    # Paperclip Validations
    validates_attachment_size :icon, :less_than => 5.megabytes
    validates_attachment_content_type :icon, :content_type => ['image/jpeg','image/jpg', 'image/png', 'image/gif']


 
  
  

  
  def update_published_at_and_permalink
      self.published_at = Time.now if (published == true && published_at.blank? )
  end
  def name
    title
    
  end
  
  
  def self.latest(i=6)
    self.where(:published=>true).limit(i).order('published_at desc')
  end
  

    def enabled
      published
    end
    def display_name
      title
    end
    def detailed_title
      title
    end
    
    def body_clean
      return "#{self.body_fr.gsub(/<[a-zA-Z\/][^>]*>/){}}"
    end
    

    def self.full_text_search(q, options = {})
      return nil if q.nil? or q==""
      default_options = {:limit => 10, :page => 1}
      options = default_options.merge options

      # get the offset based on what page we're on
      options[:offset] = options[:limit] * (options.delete(:page).to_i-1)  

      # now do the query with our options
      results = Article.find_by_contents(q, options)
      return [results.total_hits, results]
    end
    def title_with_date
      self.display_date.loc("%d.%m.%y")+" - "+self.title
    end
    

    def display_date
      if self.alternate_date.nil?
        self.published_at.nil? ? self.created_at : self.published_at
      else
        self.alternate_date
      end
    end

    
    def self.list_archives_years
      sql="select distinct(year(published_at)) as year from articles order by published_at"
      find_by_sql(sql)
    end
    def self.list_archives_months(year)
      sql="select distinct(month(published_at)) as month from articles where year(published_at)=#{year} order by published_at"
      find_by_sql(sql)
    end

    def self.list_all_archives_by_lang(lang,category)
      
      unless category.nil?
        cats=category.children.collect(&:id)
        cats<<category.id
        if category.sort_by_alternate_date
          self.find_all_by_category_id_and_published_and_language_code( cats,true,lang,:order=>'alternate_date desc').map{ |u| u.alternate_date.to_date}
        else
          self.find_all_by_category_id_and_published_and_language_code( cats,true,lang,:order=>'published_at desc').map{ |u| u.published_at.to_date}
        end
      else
         if category.sort_by_alternate_date
           self.find_all_by_published_and_language_code( true,lang,:order=>'alternate_date desc').map{ |u| u.alternate_date.to_date}
         else
           self.find_all_by_published_and_language_code( true,lang,:order=>'published_at desc').map{ |u| u.published_at.to_date}
        end
      end
      
    end
    
    def self.list_all_archives_by_tag(lang,tag)          
      self.find_tagged_with(tag,:order=>'published_at desc',:conditions=>['language_code=?',lang]).map{ |u| u.published_at.to_date}
    end
    
    def self.find_latest_from_parent(locale,parent_id,limit)
       extracond="and (category_id=#{parent_id} or category_id in (select id from categories where parent_id=#{parent_id}))"
       return self.find(:all,:include => [:category], :order => 'articles.published_at DESC', :conditions =>  " published=true  and (language_code='#{locale}'  or all_languages=1 ) #{extracond} ",  :limit=>limit)      
    end
    def self.find_all_latest_from_parent(parent_id,limit)
       extracond="and (category_id=#{parent_id} or category_id in (select id from categories where parent_id=#{parent_id}))"
       return self.find(:all,:include => [:category], :order => 'articles.published_at DESC', :conditions =>  " published=true  #{extracond} ",  :limit=>limit)      
    end
    def self.find_latest(locale,limit=16)
      self.find(:all,:include=>:user,:order => 'articles.published_at DESC', :conditions =>  " published=true  and language_code='#{locale}'  ",  :limit=>limit)      
    end
    
    
    def self.find_last_week_news(locale)
       extracond="and (category_id=2 or category_id in (select id from categories where parent_id=2))"
       extracond<< " and articles.published_at > '#{(Time.now - 7.days).to_date.to_s(:db)}' "
       return self.find(:all,:include => [:user,:category], :order => 'articles.published_at DESC', :conditions =>  " published=true  and language_code='#{locale}' #{extracond} ")           
    end
    

   #def self.find_all_for_archive(category,language_code)
   #  order="published_at desc"
   #  conditions=["articles.published_at<?",Time.now.beginning_of_month]
   #  find_all_by_published(true,:order=>order,:conditions=>conditions)
   #end
   #



    def self.per_page
      10
    end
    def self.list_all(page)
      paginate :per_page => 10, :page => page,
      :order => 'published_at DESC'
    end


    def display_title
      title
    end
    def title_with_category
      tt=""
       if self.category
          if self.category.parent
            tt<<self.category.parent.name
            tt<<" ::: "
          end
          tt<<self.category.name
          tt<<" :::  "
        end
        tt<<self.title
      
    end


    def keywords
      kw=""
      if self.category
        if self.category.parent
          kw<<self.category.parent.name
          kw<<", "
        end
        kw<<self.category.name
        kw<<", "
      end
      kw
    end
    def related_edition_id
      self.events.collect(&:edition_id).uniq.delete_if {|x| x == nil }
    end

    

    def self.previous(article)
      unless article.published_at.blank?
        find_by_sql([" select * from articles where category_id=#{article.category_id.to_s} and language_code='#{article.language_code}' and articles.id!=#{article.id} and published_at<'#{article.published_at.to_s(:db)}' order by published_at DESC  limit 6"])
      else
        find_by_sql([" select * from articles where category_id=#{article.category_id.to_s} and language_code='#{article.language_code}' and articles.id!=#{article.id} order by published_at DESC  limit 6"])
      end
    end

    def self.following(article)
      unless article.published_at.blank?
        find_by_sql([" select * from articles where category_id=#{article.category_id.to_s} and language_code='#{article.language_code}' and articles.id!=#{article.id} and published_at>'#{article.published_at.to_s(:db)}' order by published_at ASC limit 6 "])
      else
        find_by_sql([" select * from articles where category_id=#{article.category_id.to_s} and language_code='#{article.language_code}'  and articles.id!=#{article.id} order by published_at ASC limit 6 "])
      end
    end


    def pref_intro
      unless self.intro.blank?
        return self.intro
      else
        
        return  self.body.truncate(20) unless self.body.blank?
      end
    end

    def rss_intro
      if self.category.use_file
        return self.sub_title+", "+I18n.l(self.display_date,:format=>"%e %B %Y")
      else
      
       unless self.intro.blank?
         return self.intro
       else

         return "" #self.body.truncate(35) unless self.body.blank?
       end
     end
   end
  end
