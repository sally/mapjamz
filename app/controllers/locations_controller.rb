post '/locations' do 
  @location = Location.find_or_create_by(country: params[:input_location])
  # logic to create tracks should probably be not in the controller
  LastFmService.top_tracks(@location.country).each do |track|
    @location.tracks << Track.find_or_create_by(name: track)
  end
  redirect "/locations/#{@location.id}"
end

get '/locations/:id' do 
  @location = Location.find(params[:id])
  @top_tracks = @location.tracks
  erb :'/locations/show'
end