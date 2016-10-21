get '/login' do
  erb :'sessions/new'
end


post '/login' do
  @user = User.find_by_email(params[:email])

  if @user && @user.password == params[:password]
    # session[:id] = @user.id
    login(@user)
    redirect '/'

  else
    @errors = ["Username & Password not found."]
    erb :'sessions/new'
  end
end

get '/logout' do
  logout 
  redirect '/'
end
