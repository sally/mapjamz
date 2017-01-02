helpers do 
  def create_tracks(location)
    RankingService.top_tracks(location).map do |track_hash|
      Track.find_or_create_by(track_hash)
    end
  end

  def associate_tracks(location)
    location.top_tracks.destroy_all # Remove all associations with this location
    create_tracks(location.country).map do |track|
      TopTrack.create(track: track, location: location) # Re-create associations for top tracks
    end
  end
end
