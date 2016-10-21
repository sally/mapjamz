module LastFmService
  include HTTParty

  KEY = ENV['LAST_FM_API_KEY']

  # def self.song_info(artist,song)
  #   p url = "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=9fc86c40ce0f4704f7e83f97c491ddfa&artist=#{artist}&track=#{song}&format=json"
  #   p uri = Addressable::URI.parse(url).normalize.to_s.gsub(/(\%)/, " ")

  #   pry

  #   response = HTTParty.get(uri)

  #   parsed_response = response.parsed_response["track"]
  # end

  # def self.get_song_description(artist,song)
  #   if song_info(artist,song)["wiki"]
  #     song_info(artist,song)["wiki"]["summary"].gsub("\n", "").gsub(/(\s*\<.*\/.*\>.?)/, '')
  #   else
  #     Faker::Lorem.paragraph
  #   end
  # end

  def self.top_tracks(country)
    url = "http://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=#{country}&limit=25&api_key=#{KEY}"

    response = HTTParty.get(url)

    parsed_response = response.parsed_response
    track_list = parsed_response['lfm']['tracks']['track']
    
    track_list.map do |track|
      {name: track['name'],
       artist: track['artist']['name'],
       image_url: track['image'][3]['__content__'],
       summary: "Meditation kale chips locavore 8-bit venmo pabst. Distillery iphone kitsch williamsburg lumbersexual beard authentic. Tilde carry chambray kickstarter actually mixtape chicharrones polaroid. Blog street loko schlitz. Lo-fi crucifix heirloom ethical wes anderson. Plaid chillwave poutine blog echo drinking cornhole. Kinfolk quinoa pop-up vice pbr&b selfies xoxo post-ironic. Health leggings bespoke sustainable. Meh pop-up hashtag wolf yuccie scenester. Tote bag chicharrones five dollar toast squid 90's try-hard vinegar bitters."}
    end
  end
end

