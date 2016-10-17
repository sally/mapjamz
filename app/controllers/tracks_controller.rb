post '/tracks' do 
  @location = Location.find_by(country: params[:input_location])

 # logic to create tracks should probably be not in the controller
  LastFmService.top_tracks(@location.country).each do |track|
    @location.tracks << Track.find_or_create_by(name: track)
  end
  @top_tracks = @location.tracks

  if request.xhr?
    @top_tracks.to_json
  else
    "cry"
  end
end