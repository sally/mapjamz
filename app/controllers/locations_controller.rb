post '/locations' do 
  @location = Location.find_or_create_by(country: params[:input_location])

  if request.xhr?
    @location.to_json
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
    @coordinates.to_json
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