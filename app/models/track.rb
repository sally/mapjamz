class Track < ActiveRecord::Base

  has_many :top_tracks
  has_many :locations, through: :top_tracks

  # validates :name, uniqueness: {scope: :artist}

  before_create :populate_youtube_data

  def populate_youtube_data
    image_url, youtube_id = YoutubeService.download_track_data(artist + " " + name)
    write_attribute(:image_url, image_url) unless self.image_url.present?
    write_attribute(:youtube_id, youtube_id)
  end
end
