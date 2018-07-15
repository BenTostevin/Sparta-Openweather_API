require 'httparty'
require 'json'

class HistoricalWeather

  include HTTParty

  def initialize
    @api_key = '93bf8bc0841a2f8df65a1dd7a3642eb4'
  end

  def get_response
    @city2 = JSON.parse(self.class.get("https://samples.openweathermap.org/data/2.5/history/city?q=Chichester,UK&appid=b1b15e88fa797225412429c1c50c122a1").body)
  end

  def get_message
    @city2["cod"]
  end


end
