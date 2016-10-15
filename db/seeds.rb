users = 20.times.map do
  User.create!( :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end


sally = User.create!(
  :username => 's',
  :email => 's@s',
  :password => 's')

####

spain=Location.create(country: 'spain')

tr1=Track.create(name: 'hotline bling')
tr2=Track.create(name: 'peach')

spain.tracks << tr1
spain.tracks << tr2