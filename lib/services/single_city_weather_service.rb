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
    @city = JSON.parse(self.class.get("q=London&appid=#{@api_key}").body)
  end

  def print_result
    puts @city
  end

  def get_weather
    @city["weather"]
  end

end
