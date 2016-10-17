exclass CreateTopTracks < ActiveRecord::Migration
  def change
    create_table :top_tracks do |t|
      t.integer :location_id
      t.integer :track_id

      t.timestamps null:false
    end
  end
end
