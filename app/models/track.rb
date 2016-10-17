class Track < ActiveRecord::Base
  has_many :toptracks
  has_many :locations, through: :toptracks
end
