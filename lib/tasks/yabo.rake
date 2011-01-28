require 'string_tools'
namespace :yabo do
    namespace :tools do
       desc 'Create a bunch of dumy users.'                                                                                    
       task :dummy_users => :environment do              
          User.create(:login         =>         "ahe",          :name         =>         "Anthony",           :email         =>         "ahe@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "willd",        :name         =>         "Wilfried",        :email         =>         "willd@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>        "marcos",         :name        =>         "Marcos",          :email        =>         "marcos@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>        "onyewuo",         :name         =>        "Ogushi",        :email        =>         "onyewuo@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>          "sarrm",         :name         =>          "Momo",        :email          =>         "sarrm@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>        "mulemol",         :name         =>        "Landry",        :email        =>         "mulemol@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "witsela",        :name         =>         "Axel",        :email         =>         "witsela@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>        "defours",         :name         =>        "Steven",        :email        =>         "defours@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>        "goreuxr",         :name        =>         "Reginal",       :email        =>         "goureux@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "jova",         :name         =>         "Milan",            :email         =>         "jova@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login        =>        "decamar",        :name       =>        "Igor",                    :email        =>        "decamar@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login        =>         "mbokani",        :name        =>        "Dieumerci",       :email         =>        "mbokani@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login        =>         "nicaise",        :name        =>         "Benjamin",       :email         =>        "nicaise@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "bolats",         :name         =>         "Sinan",        :email         =>         "bolats@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>          "leonb",         :name         =>         "Leon",         :email          =>         "leonb@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "espi",         :name         =>         "Aragon",           :email         =>         "espi@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "carce",         :name         =>         "Medhi",          :email         =>         "carce@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>        "manga",         :name         =>         "Eliaquim",         :email        =>         "manga@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "miku",         :name         =>         "Tomislav",         :email         =>         "miku@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login        =>         "maestro",        :name         =>        "Segio",          :email         =>        "maestro@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "bolo",          :name         =>         "Laszlo",          :email         =>         "bolo@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>         "pesto",          :name         =>         "Joaquim",         :email         =>         "ahe@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login         =>          "pf",         :name         =>          "Pierre",            :email          =>         "pf@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
          User.create(:login          =>          "moi",          :name          =>          "Moi",         :email          =>          "moi@ahe.be" ,:password=>"mypass",:password_confirmation=>"mypass")
      end
      desc 'Flush all members'
      task :flush_members => :environment do
        Member.destroy_all
      end  
      
      desc 'create admin'
      task :create_admin => :environment do
         User.delete_all
          Role.delete_all
        # Create admin role and user
        admin_role = Role.create(:name => 'admin')

        user = User.create do |u|
          u.login = 'admin'
          u.password = u.password_confirmation = 'admin43'
          u.email = 'admin@change.me'
        end

        user.register!
        user.activate!

        user.roles << admin_role
      end  

      desc  'drop admin'
      task :drop_admin => :environment do
        User.delete_all
        Role.delete_all

      end


      desc "load countries"
      task :load_countries => :environment do
        Geocountry.delete_all
        Georegion.delete_all
        sql = File.open(RAILS_ROOT+"/db/export_all_countries.sql").read
        sql.split(';').each do |sql_statement|
          ActiveRecord::Base.connection.execute(sql_statement)
        end


      end

      desc "load locales"
      task :load_locales => :environment do

 
          sql = File.open(RAILS_ROOT+"/db/export_languages.sql").read
          sql.split(';').each do |sql_statement|
            ActiveRecord::Base.connection.execute(sql_statement) unless sql_statement.blank?
          end
        # Locale.create(:code=>'en',:name=>'English')
        # 
        #        Locale.create(:code=>'fr',:name=>'French')
        # 
        #        Locale.create(:code=>'de',:name=>'German')
      end

     # 
     # desc 'init base'
     # task :init_base => :environment do
     #   Rake::Task['yabo:tools:load_locales'].invoke
     #   Rake::Task['yabo:tools:load_countries'].invoke
     #   Rake::Task['yabo:tools:create_admin'].invoke
     # end
     # 
      
      
      desc 'Delete all existing pages.'     
      task :flush_pages => :environment do
        Page.destroy_all
      end
      desc 'Create default pages.'    
      task :create_pages => :environment do

       p=Page.create(:title=>'Qui sommes-nous ?')
       pp=Page.create(:title=>'Présentation', :parent_id=>p.id)
       pp=Page.create(:title=>'Histoire', :parent_id=>p.id)
       pp=Page.create(:title=>'Valeurs', :parent_id=>p.id)
       pp=Page.create(:title=>'Structure', :parent_id=>p.id)
       pp=Page.create(:title=>'Equipe', :parent_id=>p.id)
            
      p=Page.create(:title=>'News')
      		pp=Page.create(:title=>'Dernières News', :parent_id=>p.id) 
      		pp=Page.create(:title=>'Philgood Newsletter', :parent_id=>p.id)
      		pp=Page.create(:title=>'Philias dans les médias', :parent_id=>p.id)
      		pp=Page.create(:title=>'A lire et à découvrir', :parent_id=>p.id)
      		
      		
      		
      p=Page.create(:title=>'Responsabilité Sociale')
      	pp=Page.create(:title=>'Définition/Expertise', :parent_id=>p.id)   
      	pp=Page.create(:title=>'Glossaire RSE', :parent_id=>p.id)   
      
      
      p=Page.create(:title=>'Services') 
      	pp=Page.create(:title=>'Conseils RSE', :parent_id=>p.id)  
      		ppp=Page.create(:title=>'Diagnostic RSE', :parent_id=>pp.id)  
      		ppp=Page.create(:title=>'Définition des axes stratégiques', :parent_id=>pp.id)   
          ppp=Page.create(:title=>'Dialogue avec les parties prenantes', :parent_id=>pp.id)  
      		ppp=Page.create(:title=>'Volontariat et mécénat', :parent_id=>pp.id)  
      	pp=Page.create(:title=>'Vie de Réseau', :parent_id=>p.id)  
      		ppp=Page.create(:title=>'Activités de réseau', :parent_id=>pp.id)   
          ppp=Page.create(:title=>'Assemblée et Conférence Annuelle')
      	pp=Page.create(:title=>'Partenariats ONG/entreprises', :parent_id=>p.id)  
      		ppp=Page.create(:title=>'Paroles d’experts', :parent_id=>pp.id)  
      		ppp=Page.create(:title=>'Annuaire Humagora', :parent_id=>pp.id)   
      		ppp=Page.create(:title=>'Secteur non lucratif', :parent_id=>pp.id)  
      		
      		
      p=Page.create(:title=>'Initiatives', :parent_id=>p.id) 
      p=Page.create(:title=>'Evénements', :parent_id=>p.id) 
      	pp=Page.create(:title=>'Humagora', :parent_id=>p.id)   
      	pp=Page.create(:title=>'Conférence Humagora', :parent_id=>p.id)   
      	pp=Page.create(:title=>'Philias CSR Award', :parent_id=>p.id)   
   
        
      end
    end
    
    
    desc 'Create YAML test fixtures from data in an existing database.  
    Defaults to development database.  Set RAILS_ENV to override.'
    task :extract_fixtures => :environment do
      sql  = "SELECT * FROM %s"
      skip_tables = ["schema_info"]
      ActiveRecord::Base.establish_connection
      (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
        i = "000"
        File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
          data = ActiveRecord::Base.connection.select_all(sql % table_name)
          file.write data.inject({}) { |hash, record|
            hash["#{table_name}_#{i.succ!}"] = record
            hash
          }.to_yaml
        end
      end
    end
    
   
    desc 'import videos from SEM'
    task :import_videos  => :environment do
      LegacyVideo.all.each do |vid|
        surl=""
        if vid.embeded.match(/(youtube.com*)/) || vid.embeded.match(/(youtube-nocookie.com*)/)      
          if vid.embeded.extract_youtube_id
            surl="http://www.youtube.com/watch?v=#{vid.embeded.extract_youtube_id}"
            #  puts "#{vid.id} is a youtube video with id of #{vid.embeded.extract_youtube_id} "
          else
            puts "#{vid.id} is NOT a youtube video ERROR"
          end
        elsif vid.embeded.match(/(facebook.com*)/)      
          puts "#{vid.id} is a facebok video "

        elsif vid.embeded.match(/(myspace.com*)/)
#          puts "#{vid.id} is a myspace video "
          surl="http://www.myspace.com/video/vid/#{vid.embeded.extract_myspace_id}"
        elsif vid.embeded.match(/(dailymotion.com*)/)
          surl="http://www.dailymotion.com/video/#{vid.embeded.extract_dailymotion_id}"
          
         # puts "#{vid.id} is a dailymotion video "
        elsif vid.embeded.match(/(vimeo.com*)/)
          surl="http://www.vimeo.com/#{vid.embeded.extract_vimeo_id}"
          # puts "#{vid.id} is a vimeo video with id of #{vid.embeded.extract_vimeo_id}"
        else
          puts "what the fuck is this #{vid.id} ??"
        end

        unless surl.blank?
          
          if Video.create(:source_url=>surl,:title=>vid.title,:artist=>vid.artist,:year=>vid.year,:description=>vid.description)
            puts "video #{surl} created"
          else
            puts "and error occured with #{surl}"
          end
            
        end

      end

    end

  
   
   
   
   
   
   desc 'import pictures in a given gallery'
   task :import_pictures => :environment do
     gallery_id=ENV["GALLERY_ID"]
     import_folder=ENV["IMPORT_FOLDER"]
     puts "gallery_id=#{gallery_id} import_folder=#{import_folder}"
     gallery=Gallery.find(gallery_id)
     photo_names=gallery.photos.map(&:image_file_name)
     strpath="#{Rails.root}/public#{import_folder}"
     
     lst=Dir.new(strpath).entries.sort
     
     lst.each do |e| 
       if e.ends_with?(".jpg")
          f=File.join(strpath,e)
         
          ext=e.get_file_extension
          ctype= ext=="jpg" ? "jpeg" : ext
          p=Photo.new(:image =>File.open(f))
          unless photo_names.include?(e) 
             puts "will import #{e}"
             gallery.photos<<p
          else
             puts "#{e} already exists"
          end
       end
     end
   end
    
    
end           #Image.new(:storage => File.open('/path/to/my/image.png', rb))






#
#galleries=Gallery.find(:all,:conditions=>'photos_count=0')
#galleries.each do |gallery|
#  strpath=RAILS_ROOT+"/public/_library/galleries/"+gallery.events[0].start_date.loc("%Y_%m")+"/"+gallery.name
#  Dir.new(strpath).entries.each do |e| 
#    if e.ends_with?(".jpg")
#        f=File.join(strpath,e)
#        #puts "will add #{f} to gallery #{gallery.name}"
#         ext=e.get_file_extension
#          ctype= ext=="jpg" ? "jpeg" : ext
#          p=Photo.create(:filename =>f,:content_type => 'image/'+ctype, :temp_path=>f)
#          gallery.photos<<p
#    end
#  end
#end












def create_sponsor(name,url,img)
   m=Sponsor.create(:name => name, :url=>url)
   File.open(RAILS_ROOT+'/public/images/logos/'+img) { |image| m.assets<<Asset.new(:data=>image)}
   m.enabled=true
   m.save
end                                                                               

