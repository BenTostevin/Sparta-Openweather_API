require 'httparty'
require 'json'

class WeatherStation

  include HTTParty

  def initialize
    @api_key = '93bf8bc0841a2f8df65a1dd7a3642eb4'
  end

  def get_response
    @station = JSON.parse(self.class.get("https://samples.openweathermap.org/data/3.0/stations?appid=b1b15e88fa797225412429c1c50c122a1").body)
  end

  def get_message
    
  end


end
