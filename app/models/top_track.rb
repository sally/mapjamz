class TopTrack < ActiveRecord::Base
  belongs_to :location 
  belongs_to :track
end
