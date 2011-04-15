class AddCachedTagListToVideos < ActiveRecord::Migration
  def self.up
    add_column :videos, :cached_tag_list, :string
  end

  def self.down
    remove_column :videos, :cached_tag_list
  end
end
