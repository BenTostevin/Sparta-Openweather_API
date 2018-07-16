require 'httparty'
require 'json'

class SingleCityWeather

  include HTTParty

  base_uri 'api.openweathermap.org/data/2.5/weather?'

  def initialize
    @api_key = '93bf8bc0841a2f8df65a1dd7a3642eb4'
  end

  def get_response
    @city_name = 'Kawasaki'
    @city = JSON.parse(self.class.get("q=#{@city_name}&appid=#{@api_key}").body)
  end

  def get_weather
    @city["weather"]
  end

  def weather_length
    get_weather.length
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

  def compare_name
    @city["name"] == @city_name
  end

  def country_name_length
    @city["sys"]["country"].length
  end

  def get_description
    @city["weather"][0]["description"]
  end

  def base_has
    @city["base"]
  end

  def get_visibility
    @city["visibility"]
  end

  def main_size
    @city["main"].size
  end

end
