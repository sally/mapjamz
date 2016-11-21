class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artist
      t.string :image_url
      t.integer :listeners
      t.string :youtube_id
      t.string :summary

      t.timestamps null:false
    end
  end
end
