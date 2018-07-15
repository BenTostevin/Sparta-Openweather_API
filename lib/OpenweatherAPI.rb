require_relative 'services/single_city_weather_service.rb'
require_relative 'services/historical_weather_data.rb'
require_relative 'services/weather_station.rb'

class OpenweatherAPI

  def single_city_weather
    SingleCityWeather.new
  end

  def historical_weather
    HistoricalWeather.new
  end

  def weather_station
    WeatherStation.new
  end
end



superClass = OpenweatherAPI.new

station = superClass.weather_station

station.get_response
station.print_result
