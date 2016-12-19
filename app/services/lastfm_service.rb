module LastFmService
  include HTTParty

  KEY = ENV['LAST_FM_API_KEY']

  def self.top_tracks(country)
    country = NormalizeCountry(country, :to => :iso_name)

    # Vietnam search still doesn't work through NormalizeCountry, because Last.fm wants "Viet Nam"
    country = "Viet Nam" if country == "Vietnam"

    url = "http://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=#{country}&limit=10&api_key=#{KEY}"

    response = HTTParty.get(url)

    parsed_response = response.parsed_response
    track_list = parsed_response['lfm']['tracks']['track']

    placeholder_summary = "Here's where I would put a song summary/description. IF I HAD ONE."

    track_list.map do |track|
      {name: track['name'],
       artist: track['artist']['name'],
       listeners: track['listeners'],
       image_url: track['image'][3]['__content__'],
       summary: placeholder_summary}
    end
  end
end
