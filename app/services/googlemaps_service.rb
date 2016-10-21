module GoogleMapsService
  include HTTParty

  KEY = ENV['GOOGLE_API_KEY']

  def self.get_latitude(country)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{country}&key=#{KEY}"

    response = HTTParty.get(url)
    results = response["results"]

    latitude = results.first["geometry"]["location"]["lat"]
  end

  def self.get_longitude(country)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{country}&key=#{KEY}"

    response = HTTParty.get(url)
    results = response["results"]

    longitude = results.first["geometry"]["location"]["lng"]
  end
end