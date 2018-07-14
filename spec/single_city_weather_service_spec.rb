require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the single city weather service' do

    before(:all) do
      @city = OpenweatherAPI.new.single_city_weather
      @city.get_response
    end

    # 1
    it 'should have weather as an array' do
      expect(@city.get_weather).to be_a Array
    end

    # 2
    it 'should have two co-ordinates' do
      expect(@city.no_of_coords).to eq 2
    end

    # 3
    it 'should have longitude as a float' do
      expect(@city.get_longitude).to be_a Float
    end

    # 4
    it 'should have latitude as a float' do
      expect(@city.get_latitude).to be_a Float
    end

    # 5
    it 'should have id as an integer' do
      expect(@city.get_id).to be_a Integer
    end

    # 6
    it 'should have id as at most three digits long' do
      expect(@city.id_length).to be <= 3
    end

    # 7
    it 'should have sunrise as an integer' do
      expect(@city.get_sunrise).to be_a Integer
    end

    # 8
    it 'should have sunrise between 0 and 9999999999' do
      expect(@city.get_sunrise).to be_between(0,9999999999)
    end

    # 9


    # 10
    # 11
    # 12
    # 13
    # 14
    # 15



  end

end
