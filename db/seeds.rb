# users = 20.times.map do
#   User.create!( :username  => Faker::Internet.user_name,
#                 :email      => Faker::Internet.email,
#                 :password   => 'password' )
# end

alphabet = %(a b c d e f g h i j k l m n o p q r s t u v w x y z).split

alphabet.map do |letter|
  User.create!(username: letter, email: letter, password: letter)
end

####

# spain=Location.create(country: 'spain')

# tr1=Track.create(name: 'hotline bling')
# tr2=Track.create(name: 'peach')

# spain.tracks << tr1
# spain.tracks << tr2