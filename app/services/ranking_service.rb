module RankingService
  include HTTParty

  KEY = ENV['LAST_FM_API_KEY']
  MELON_KEY = ENV['MELON_API_KEY']

  def self.top_tracks(country)
    country = NormalizeCountry(country, :to => :iso_name)
    # Vietnam search still doesn't work through NormalizeCountry, because Last.fm wants "Viet Nam"
    country = "Viet Nam" if country == "Vietnam"

    if country == "Korea, Republic of" 
      top_tracks_from_melon # use Melon as data source
    else 
      top_tracks_from_lastfm(country) # use LastFm as data source
    end
  end

  # Melon API response example: 
  # { "songs": {
  #     "song": [{"songId" => 30179089,
  #               "songName" => "당신의 밤 (Feat. 오혁)",
  #               "artists" => {
  #                 "artist" => [{"artistId" => 1285544,
  #                               "artistName" => "황광희 X 개코"}]
  #               },
  #               "albumName" => "무한도전 위대한 유산"},
  #               { ... }]
  # }}
  def self.top_tracks_from_melon
    url = "http://apis.skplanetx.com/melon/charts/realtime?version=1&page=1&count=10"
    headers = { "appKey" => MELON_KEY, "Accept" => "application/json" }
    response = HTTParty.get(url, headers: headers).parsed_response
    track_list = response["melon"]["songs"]["song"]
    track_list.map do |track|
      { 
        name: track["songName"],
        artist: track["artists"]["artist"].first["artistName"]
      }
    end
  end

  def self.top_tracks_from_lastfm(country)
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
