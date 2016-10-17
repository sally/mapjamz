class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artist
      t.string :image_url
      t.integer :location_id

      t.timestamps null:false
    end
  end
end
