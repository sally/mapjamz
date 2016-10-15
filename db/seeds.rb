users = 20.times.map do
  User.create!( :username  => Faker::Internet.user_name,
                :email      => Faker::Internet.email,
                :password   => 'password' )
end
