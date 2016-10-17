helpers do 
  def create_and_assign_tracks(location)
    LastFmService.top_tracks(location).map do |track_hash|
      @location.tracks << Track.find_or_create_by(track_hash)
  end
  end
end