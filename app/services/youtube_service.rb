module YoutubeService
  include HTTParty

  KEY = ENV['GOOGLE_API_KEY']
  
  # Relevant Youtube api response example: 
  # {"items"=>
  #   [{"id"=>{"kind"=>"youtube#video", "videoId"=>"z1gn-CRc0qQ"},
  #     "snippet"=>
  #      { "thumbnails"=>
  #        {"default"=>{"url"=>"https://i.ytimg.com/vi/z1gn-CRc0qQ/default.jpg", "width"=>120, "height"=>90},
  #         "medium"=>{"url"=>"https://i.ytimg.com/vi/z1gn-CRc0qQ/mqdefault.jpg", "width"=>320, "height"=>180},
  #         "high"=>{"url"=>"https://i.ytimg.com/vi/z1gn-CRc0qQ/hqdefault.jpg", "width"=>480, "height"=>360}} 
  #       }}]}
  def self.download_track_data(query)
    url = "https://www.googleapis.com/youtube/v3/search?key=#{KEY}&type=video&part=snippet&maxResults=1&q=#{query}".gsub("\u{d8}", "")
    response = HTTParty.get(URI::encode(url)).parsed_response

    if response['items'].present?
      youtube_id = response['items'].first['id']['videoId']
      image_url = response['items'].first['snippet']['thumbnails']['default']['url']
      [image_url, youtube_id]
    else
      youtube_id = ["ZXVhOPiM4mk", "d9TpRfDdyU0"].sample
      [nil, youtube_id]
    end
  end
end
