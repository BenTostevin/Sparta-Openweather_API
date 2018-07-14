require 'httparty'
require 'json'
require 'faker'

class SingleCityWeather

  include HTTParty

  base_uri 'api.openweathermap.org/data/2.5/weather?'

  def initialize
    @api_key = '93bf8bc0841a2f8df65a1dd7a3642eb4'
  end

  def get_response
    @city = JSON.parse(self.class.get("q=Kawasaki&appid=#{@api_key}").body)
  end

  def print_result
    puts @city
  end

  def get_weather
    @city["weather"]
  end

  def no_of_coords
    @city["coord"].size
  end

  def get_longitude
    @city["coord"]["lon"]
  end

  def get_latitude
    @city["coord"]["lat"]
  end

  def get_id
    @city["weather"][0]["id"]
  end

  def id_length
    get_id.to_s.length
  end

  def get_sunrise
    @city["sys"]["sunrise"]
  end

  def capitalize_name
    @city["name"][0]
  end

end

# weather_test = SingleCityWeather.new
# weather_test.print_result
