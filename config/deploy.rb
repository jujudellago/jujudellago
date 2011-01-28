set :deploy_to, "/home/jujudell/apps/jujudellago"
set :application, "jujudell.yabo-sites.com"


role :web, "jujudell@174.122.37.162"
role :app, "jujudell@174.122.37.162"
role :db,  "jujudell@174.122.37.162", :primary => true


default_run_options[:pty] = true 

# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

set :use_sudo, false
set :keep_releases, 4

set :scm, :git
#set :scm_command, "/usr/bin/git"
#set :local_scm_command, "/usr/local/bin/git"


set :branch, "master"
set :repository, "git@github.com:jujudellago/jujudellago.git"
set :deploy_via, :remote_cache


# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
 task :start do ; end
 task :stop do ; end
 task :restart, :roles => :app, :except => { :no_release => true } do
   run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
 end
end



namespace :rake do
  task :show_tasks do
    run("cd #{deploy_to}/current; /usr/bin/rake -T")
  end
end


desc "migrate database"
task :migrate_db, :roles => [:app] do
  run("cd #{deploy_to}/current;  rake db:migrate RAILS_ENV=production")
end

desc "export all db content"
task :dump_db, :roles => [:app] do
  fn="export_all_jujudell_#{Time.now.strftime("%d.%m.%Y")}.sql"
  run("cd /home/jujudell/backups/mysql;   mysqldump  -c  jujudell_jujudellago_prod -u jujudell_yabonew -pkristina  --default-character-set=utf8 > #{fn}")
end


after 'deploy:update_code', :link_frozen_rails
desc "symlink shared ruby gems to vendor directory"
task :link_frozen_rails, :roles => [:app] do
  run <<-EOF
      ln -s #{shared_path}/galleries #{latest_release}/public/galleries  ;  
      ln -s #{shared_path}/ruby #{latest_release}/vendor/bundle/ruby  ; 
      cp #{shared_path}/.htaccess #{latest_release}/public/ ; 
      cp   #{shared_path}/config/* #{latest_release}/config/ ; 
      cp   #{shared_path}/Gemfile.lock #{latest_release}/ ;
      bundle install --path vendor/bundle
  EOF
end
# ln -s #{shared_path}/ruby #{latest_release}/vendor/  ;
#
#
#after 'deploy:update_code', :update_yc_config
#desc "copy yc_config to current dir"
#task :update_yc_config, :roles => [:app] do
#  run <<-EOF
#     cp #{shared_path}/config/yc_config.yml  #{latest_release}/config/
#  EOF
#end
#
#after 'deploy:update_code', :link_icons_and_flags
#desc "symlink icons and flags"
#task :link_icons_and_flags, :roles => [:app] do
#  run <<-EOF
#      ln -s #{shared_path}/public/images/flags  #{latest_release}/public/images/   && ln -s #{shared_path}/public/images/icons #{latest_release}/public/images/ 
#  EOF
#end
after 'deploy:update_code', :regenerate_js_merged
desc "regenerate js and css"
task :regenerate_js_merged, :roles => [:app] do
  run <<-EOF
      cd #{latest_release} &&  rake asset:packager:build_all 
  EOF
end

#
#after 'deploy:update_code', :update_shared_files
#desc "symlinks to shared folders"
#task :update_shared_files, :roles => [:app] do
#  run <<-EOF
#     ln -s #{shared_path}/public/uploads #{latest_release}/public/ && ln -s #{shared_path}/public/assets #{latest_release}/public/ 
#  EOF
#end
#
#after "deploy:update_code", "deploy:copy_old_sitemap"
#
#namespace :deploy do
#  task :copy_old_sitemap do
#    run "if [ -e #{previous_release}/public/sitemap_index.xml.gz ]; then cp #{previous_release}/public/sitemap* #{current_release}/public/; fi"
#  end
#end
#
#
#
##after 'deploy:update_code', :update_sitemap
#desc "update sitemap"
#task :update_sitemap, :roles => [:app] do
#  run <<-EOF
#     cd #{latest_release} &&  rake -s sitemap:refresh RAILS_ENV=production 
#  EOF
#end
#
#
#
#