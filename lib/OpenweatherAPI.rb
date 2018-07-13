require_relative 'services/single_city_weather_service.rb'

class OpenweatherAPI

  def single_city_weather
    SingleCityWeather.new
  end

end

superClass = OpenweatherAPI.new

city = superClass.single_city_weather

city.get_response
city.print_result
