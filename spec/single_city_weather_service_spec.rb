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

    it 'should have two co-ordinates' do
      expect(@city.no_of_coords).to eq 2
    end

    it 'should have longitude as a float' do
      expect(@city.get_longitude).to be_a Float
    end

    it 'should have latitude as a float' do
      expect(@city.get_latitude).to be_a Float
    end

    it 'should have id as an integer' do
      expect(@city.get_id).to be_a Integer
    end

    it 'should have id as at most three digits long' do
      expect(@city.id_length).to be <= 3
    end

    it 'should have sunrise as an integer' do
      expect(@city.get_sunrise).to be_a Integer
    end

    it 'should have sunrise between 0 and 9999999999' do
      expect(@city.get_sunrise).to be_between(0,9999999999)
    end

    it 'should have weather as an array containing only one item' do
      expect(@city.weather_length).to eq 1
    end

    it 'should have it\'s name be the same as @city_name' do
      expect(@city.compare_name).to be true
    end

    it 'should have country name be 2 letters long' do
      expect(@city.country_name_length).to eq 2
    end

    it 'should have description as a string' do
      expect(@city.get_description).to be_a String
    end

    it 'should have the key base containing the value stations' do
      expect(@city.base_has).to include("stations")
    end

    it 'should have a visibility value of at most 99999' do
      expect(@city.get_visibility).to be <= 99999
    end

    it 'should have main as an array of exactly 5 keys' do
      expect(@city.main_size).to eq 5
    end

  end

end
