require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the historical weather data for a city' do

    before(:all) do
      @city = OpenweatherAPI.new.historical_weather
      @city.get_response
    end

    it 'should have an array called list' do
      expect(@city.get_list).to be_kind_of Array
    end

    it 'should a hash named main inside of list' do
      expect(@city.get_main).to be_a Hash
    end

    it 'should have a temperature value to have a decimal places' do
      expect(@city.get_temp_string).to include(".")
    end

    it 'should have six items in the first item of the list array' do
      expect(@city.count_list).to eq 6
    end

    it 'should have min temp be less than or equal to max temp' do
      expect(@city.compare_temp).to be true
    end

    it 'should have temp between min and max temps' do
      expect(@city.temp_between).to be true
    end

    it 'should have the length of the description of the weather be longer than main' do
      expect(@city.long_description).to be true
    end

    it 'should have degrees of wind between 0 and 360' do
      expect(@city.wind_direction).to be_between(0,360)
    end

    it 'should have the same id if the weather was the same' do
      expect(@city.compare_id).to be true
    end

    it 'should have sea level as a float' do
      expect(@city.get_sea_level).to be_a Float
    end

    it 'should have a rain key if the weather was rain' do
      expect(@city.rain_key).to be true
    end

    it 'should have a pressure key' do
      expect(@city.has_pressure).to include("pressure")
    end

    it 'should have no leading zeros on humidity' do
      expect(@city.humidity_leading_zeros).to be true
    end

    it 'should have the same size wind key for the first item in the list and the second' do
      expect(@city.wind_size).to be true
    end

    it 'should have message be an empty string' do
      expect(@city.empty_message).to eq ""
    end

    it 'loop' do
      expect(@city.loop_test).to be true
    end

  end

end
