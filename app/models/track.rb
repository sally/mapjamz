class Track < ActiveRecord::Base
  has_many :top_tracks
  has_many :locations, through: :top_tracks
  before_save :get_youtube_id

  def get_youtube_id
    
  end
end
