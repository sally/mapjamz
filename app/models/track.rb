class Track < ActiveRecord::Base
  has_many :top_tracks
  has_many :locations, through: :top_tracks
end
