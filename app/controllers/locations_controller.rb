post '/locations' do 
  @location = Location.find_or_create_by(country: params[:input_location])
  @top_tracks = LastFmService.top_tracks(@location.country)
  redirect "/locations/#{@location.id}"
end

get '/locations/:id' do 
  @location = Location.find(params[:id])
  erb :'/locations/show'
end