class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.integer :location_id

      t.timestamps null:false
    end
  end
end
