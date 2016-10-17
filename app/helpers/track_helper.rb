helpers do 
  def create_tracks(location)
    LastFmService.top_tracks(location).map do |track_hash|
      Track.find_or_create_by(track_hash)
    end
  end

  def associate_tracks(location_obj)
    create_tracks(location_obj.country).map do |track|
      TopTrack.find_or_create_by(track)
    end
  end
end