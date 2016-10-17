class Location < ActiveRecord::Base
  validates_presence_of :country
  validates_uniqueness_of :country

  has_many :top_tracks
  has_many :tracks, through: :top_tracks
end
