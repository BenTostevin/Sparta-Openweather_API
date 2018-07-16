require 'httparty'
require 'json'

class WeatherStation

  include HTTParty

  base_uri 'https://samples.openweathermap.org/data/3.0/stations'

  def initialize
    @api_key = 'b1b15e88fa797225412429c1c50c122a1'
  end

  def get_response
    @station = JSON.parse(self.class.get("?appid=#{@api_key}").body)
  end

  def get_id
    @station["id"]
  end

  def id_starts_with_number
    @station["id"][0].to_i
  end

  def id_length
    get_id.length
  end

  def get_created_at
    @station["created_at"]
  end

  def year_created
    @station["created_at"][0..3].to_i
  end

  def time_includes_colon
    @station["created_at"]
  end

  def compare_dates
    @station["created_at"][0..3].to_i <= @station["updated_at"][0..3].to_i
  end

  def get_longitude
    @station["longitude"]
  end

  def get_latitude
    @station["latitude"]
  end

  def get_altitude
    @station["altitude"]
  end

  def get_external_id
    @station["external_id"]
  end

  def get_name
    @station["name"]
  end

  def id_ends_in_number
    @station["external_id"][-3..-1].to_i
  end

  def get_rank
    @station["rank"]
  end

  def compare_id_and_name
    @station["external_id"][0] == @station["name"][0]
  end

end
