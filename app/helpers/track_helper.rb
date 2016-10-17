helpers do 
  def create_and_assign_tracks(location)
    LastFmService.top_tracks(location).each do |track|
      @location.tracks << Track.find_or_create_by(name: track)
    end
  end
end