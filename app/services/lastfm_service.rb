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
end