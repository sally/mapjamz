helpers do 
  def create_tracks(location)
    LastFmService.top_tracks(location).map do |track_hash|
      Track.find_or_create_by(track_hash)
    end
  end

  def associate_tracks(location_obj)
    create_tracks(location_obj.country).map do |track_obj|
      TopTrack.find_or_create_by(track: track_obj,
                                 location: location_obj)
    end
  end
end