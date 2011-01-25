class ChangeTranslationTable < ActiveRecord::Migration
  def self.up
    drop_table :translations    
    create_table :translations do |t|
      t.string   :locale
      t.string   :key
      t.text     :value
      t.text     :interpolations
      t.boolean  :is_proc, :default => false
    end
  end

  def self.down
    drop_table :translations
    create_table "translations", :force => true do |t|
      t.string  "key"
      t.string  "raw_key"
      t.string  "value",               :limit => 1024
      t.integer "pluralization_index",                 :default => 1
      t.integer "locale_id"
    end
  end
end


