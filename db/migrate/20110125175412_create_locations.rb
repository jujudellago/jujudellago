class CreateLocations < ActiveRecord::Migration
  def self.up
    create_table :locations do |t|
      t.string :name
      t.string :address
      t.string :lat
      t.string :lng
      t.integer :galleries_count
      
      t.boolean :enabled,  :default=>false
      t.timestamps
    end
    add_column :galleries, :location_id, :integer
    add_column :galleries, :event_date, :date
  end

  def self.down
    remove_column :galleries, :event_date
    remove_column :galleries, :location_id
    drop_table :locations
  end
end