class AddCmsTables < ActiveRecord::Migration
  def self.up

    create_table :gallery_types, :force => true do |t|
      t.string :name
      t.integer :galleries_count
      t.string :label_fr
      t.string :label_en
      t.text :description_fr
      t.text :description_en

      t.string  "bg_file_name"
      t.string  "bg_content_type"
      t.integer "bg_file_size"

      t.string   "cached_slug"
      t.timestamps
    end

    # rails g casein:scaffold gallery_type name:string label_fr:string label_en:string description_fr:text description_en:text

    create_table "galleries", :force => true do |t|
      t.string   "name"
      t.integer :gallery_type_id
      t.string :label_fr
      t.string :label_en
      t.text :description_fr
      t.text :description_en
      t.integer  "photos_count",     :default => 0
      t.integer  "default_photo_id"
      t.boolean  "enabled",          :default => false
      t.string   "cached_slug"
      t.timestamps
    end
    # rails g casein:scaffold gallery name:string label_fr:string label_en:string description_fr:text description_en:text photos_count:integer default_photo_id:boolean enabled:boolean

    create_table "photos", :force => true do |t|
      t.integer "gallery_id"
      t.integer "width"
      t.integer "height"
      t.integer "position"
      t.string  "image_file_name"
      t.string  "image_content_type"
      t.integer "image_file_size"
      t.string  "legend_fr"
      t.string  "legend_en"
      t.boolean "watermarked",  :default => false
      t.timestamps
    end
    # rails g casein:scaffold photo gallery_id:integer legend_fr:string legend_en:string
    create_table "categories", :force => true do |t|
      t.string   "name"
      t.integer  "parent_id",              :default => 0
      t.integer  "position",               :default => 1
      t.integer  "articles_count"
      t.string   "dotted_ids"
      t.string   "cached_slug"
      t.string   "label_fr"
      t.string   "label_en"
      t.boolean  "use_intro"
 
      t.boolean  "sort_by_alternate_date", :default => false
      t.boolean  "all_langs",              :default => false
      t.integer  "infolinks_count"
            t.timestamps
    end


    create_table "articles", :force => true do |t|
      t.string   "title_fr"
      t.string   "title_en"        
      t.boolean  "published",                      :default => false

      t.datetime "published_at"
      t.integer  "category_id",                    :default => 1
      t.text     "body_fr"
      t.text     "intro_fr"

      t.text     "body_en"
      t.text     "intro_en"
      t.datetime     "alternate_date"
      t.string   "cached_tag_list"
      t.string   "cached_slug"
      t.string   "icon_file_name"
      t.string   "icon_content_type"
      t.integer  "icon_file_size"
      t.datetime "icon_updated_at"
      t.integer  "infolinks_count"
            t.timestamps
    end


    create_table "taggings", :force => true do |t|
      t.integer  "tag_id"
      t.integer  "taggable_id"
      t.string   "taggable_type"
      t.datetime "created_at"
    end

    add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
    add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

    create_table "tags", :force => true do |t|
      t.string "name"
    end
    
    create_table "locales", :force => true do |t|
      t.string "code"
      t.string "name"
    end

    add_index "locales", ["code"], :name => "index_locales_on_code"

    create_table "translations", :force => true do |t|
      t.string  "key"
      t.string  "raw_key"
      t.string  "value",               :limit => 1024
      t.integer "pluralization_index",                 :default => 1
      t.integer "locale_id"
    end

    add_index "translations", ["locale_id", "key", "pluralization_index"], :name => "index_translations_on_locale_id_and_key_and_pluralization_index"
    

  end

  def self.down

 drop_table :galleries
 drop_table :photos
 drop_table :categories
 drop_table :articles

 drop_table :gallery_types


 drop_table :tags
 drop_table :taggings
 drop_table :locales
 drop_table :translations

  end
end
