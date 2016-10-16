module LastFmService
  include HTTParty

  KEY = ENV['LAST_FM_API_KEY']

  def self.top_tracks(country)
    url = "http://ws.audioscrobbler.com/2.0/?method=geo.gettoptracks&country=#{country}&api_key=#{KEY}"

    response = HTTParty.get(url)

    parsed_response = response.parsed_response
    parsed_response['lfm']['tracks']['track']
    parsed_response['lfm']['tracks']['track'].map do |track|
      # Track.find_or_create_by(
      #   name: track["name"])
      track['name'] 
    end
  end
end