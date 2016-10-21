class Track < ActiveRecord::Base

  has_many :top_tracks
  has_many :locations, through: :top_tracks

  # validates :name, uniqueness: {scope: :artist}

  before_create :get_youtube_id

  def get_youtube_id
    write_attribute(:youtube_id, YoutubeService.get_first_video_id(artist + " " + name))
  end
end
