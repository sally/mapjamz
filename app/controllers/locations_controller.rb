post '/locations' do
  @location = Location.find_or_create_by(country: NormalizeCountry(params[:input_location], to: :iso_name))
  associate_tracks(@location)
  @top_tracks = @location.top_tracks.pluck(:track_id).map do |track_id|
                  Track.find(track_id)
                end

  if request.xhr?
    erb :'/partials/_location_tracks', layout: false, locals: {location: @location, top_tracks: @top_tracks}
  else
    redirect "/locations/#{@location.id}"
  end
end

# unrestful:(
post '/locations/coordinates' do
  @latitude = GoogleMapsService.get_latitude(params[:input_location])
  @longitude = GoogleMapsService.get_longitude(params[:input_location])
  @coordinates = [@latitude, @longitude]

  if request.xhr?
    erb :'/partials/_location_map', layout: false, locals: {lat: @latitude, lng: @longitude}
  else
    "cry"
  end
end

get '/locations/:id' do
  @location = Location.find(params[:id])
  @latitude = GoogleMapsService.get_latitude(@location.country)
  @longitude = GoogleMapsService.get_longitude(@location.country)
  @top_tracks = @location.tracks
  erb :'/locations/show'
end
