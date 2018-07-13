require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the single city weather service' do

    before(:all) do
      @city = OpenweatherAPI.new.single_city_weather
      @city.get_response
    end

    it 'should have weather as an array' do
      expect(@city.get_weather).to be_a Array
    end

  end

end
