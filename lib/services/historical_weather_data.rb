require 'httparty'
require 'json'

class HistoricalWeather

  include HTTParty

  def initialize
    @api_key = '93bf8bc0841a2f8df65a1dd7a3642eb4'
  end

  def get_response
    @city = JSON.parse(self.class.get("https://samples.openweathermap.org/data/2.5/history/city?q=Chichester,UK&appid=b1b15e88fa797225412429c1c50c122a1").body)
  end

  def print_result
    puts @city
  end

  def get_list
    @city["list"]
  end

  def get_main
    @city["list"][0]["main"]
  end

  def get_temp_string
    @city["list"][0]["main"]["temp"].to_s
  end

  def count_list
    @city["list"][0].size
  end

  def compare_temp
    @city["list"][0]["main"]["temp_min"] <= @city["list"][0]["main"]["temp_max"]
  end

  def temp_between
    (@city["list"][0]["main"]["temp"] <= @city["list"][0]["main"]["temp_max"]) && (@city["list"][0]["main"]["temp"] >= @city["list"][0]["main"]["temp_min"])
  end

  def long_description
    @city["list"][0]["weather"][0]["main"].length <= @city["list"][0]["weather"][0]["description"].length
  end

  def wind_direction
    @city["list"][0]["wind"]["deg"]
  end

  def compare_id
    if @city["list"][0]["weather"][0]["id"] == @city["list"][1]["weather"][0]["id"]
      if @city["list"][0]["weather"][0]["main"] == @city["list"][1]["weather"][0]["main"]
        true
      else
        false
      end
    elsif @city["list"][0]["weather"][0]["id"] != @city["list"][1]["weather"][0]["id"]
      if @city["list"][0]["weather"][0]["main"] != @city["list"][1]["weather"][0]["main"]
        true
      else
        false
      end
    end
  end

  def get_sea_level
    @city["list"][0]["main"]["sea_level"]
  end

  def rain_key
    if @city["list"][0]["weather"][0]["main"] == "Rain"
      if @city["list"][0].include?("rain")
        true
      else
        false
      end
    else
      true
    end
  end

  def has_pressure
    @city["list"][0]["main"]
  end

  def humidity_leading_zeros
    if @city["list"][0]["main"]["humidity"].to_s[0] == "0"
      false
    else
      true
    end
  end

  def wind_size
    @city["list"][0]["wind"].size == @city["list"][1]["wind"].size
  end

  def empty_message
    @city["message"]
  end

  # def loop_test
  #   i = 0
  #   until i == 4 do
  #     if i == 0
  #       y = false
  #     else
  #       y = true
  #     end
  #     i += 1
  #   end
  #   y
  # end


end
