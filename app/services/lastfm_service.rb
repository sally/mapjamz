module LastFmService
  include HTTParty

  KEY = ENV['LAST_FM_API_KEY']

  def self.top_tracks(country)
    url = "http://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=#{country}&limit=25&api_key=#{KEY}"

    response = HTTParty.get(url)

    parsed_response = response.parsed_response
    track_list = parsed_response['lfm']['tracks']['track']
    track_list.map do |track|
      {name: track['name'],
       artist: track['artist']['name'],
       image_url: track['image'][3]['__content__']}
    end
  end

  def self.song_info(artist,song)
    url = "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=9fc86c40ce0f4704f7e83f97c491ddfa&artist=#{artist}&track=#{song}&format=json"

    response = HTTParty.get(url)

    parsed_response = response.parsed_response["track"]
  end

  def self.get_song_description(artist,song)
    song_info(artist,song)["wiki"]["summary"].gsub("\n", "").gsub(/(\s*\<.*\/.*\>.?)/, '')
  end
end