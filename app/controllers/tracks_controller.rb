get '/tracks/:id' do 
  @track = Track.find(params[:id])
  
  if request.xhr?
    erb :'partials/_track_summary', layout: false, locals: {track: @track}
  else
    "tina noise"
  end
end