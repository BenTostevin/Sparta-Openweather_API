require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the weather station data for a city' do

    before(:all) do
      @station = OpenweatherAPI.new.weather_station
      @station.get_response
    end

    it 'should weather station' do

    end


  end

end
