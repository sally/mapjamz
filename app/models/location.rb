class Location < ActiveRecord::Base
  validates_presence_of :country
  validates_uniqueness_of :country

  has_many :tracks
end
