class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string  :source_url
      t.string  :title
      t.string  :artist
      t.string  :year, :size=>4
      t.string   :icon_file_name
      t.string   :icon_content_type
      t.integer  :icon_file_size
      t.string :thumbnail_url
      t.string :media_content_url
      t.boolean :enabled, :default=>false
      
      t.text  :description,:size=>1024

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end

end


#  rails g casein:scaffold videos title:string artist:string year:string description:text 