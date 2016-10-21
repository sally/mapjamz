module YoutubeService
  include HTTParty

  KEY = ENV['GOOGLE_API_KEY']

  def self.get_first_video_id(query)
    url = "https://www.googleapis.com/youtube/v3/search?key=#{KEY}&type=video&part=snippet&maxResults=1&q=#{query}".gsub("\u{d8}", "")

    if url.ascii_only?
      response = HTTParty.get(url)

      parsed_response = response.parsed_response

      parsed_response['items'].first['id']['videoId']
    else
      ["ZXVhOPiM4mk", "d9TpRfDdyU0"].sample
    end
  end
end