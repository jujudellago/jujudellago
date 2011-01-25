class CreateLegacyVideos < ActiveRecord::Migration
  def self.up
    create_table :legacy_videos do |t|
      t.integer :id_video
      t.integer :id_party
      t.string :artist
      t.string :title
      t.string :year
      t.text :description
      t.text :embeded
      t.string :image_path
      t.integer :vote_count
      t.integer :play_count
      t.integer :comment_count
      t.integer :nb_sort_order

      t.timestamps
    end
  end

  def self.down
    drop_table :legacy_videos
  end
end


