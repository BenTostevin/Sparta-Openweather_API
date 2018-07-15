require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the historical weather data for a city' do

    before(:all) do
      @city2 = OpenweatherAPI.new.historical_weather
      @city2.get_response
    end

    it 'should have message :' do
      expect(@city2.get_message).to eq "200"
    end


  end

end
