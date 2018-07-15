require 'spec_helper'

describe 'Openweather API test' do

  context 'testing the weather station data for a city' do

    before(:all) do
      @station = OpenweatherAPI.new.weather_station
      @station.get_response
    end

    it 'should have a string as the id' do
      expect(@station.get_id).to be_a String
    end

    it 'should have a number at the start of the id' do
      expect(@station.id_starts_with_number).to be_a Integer
    end

    it 'should have an id longer than 5 digits' do
      expect(@station.id_length).to be > 5
    end

    it 'should have the created at key as an integer' do
      expect(@station.get_created_at).to be_a String
    end

    it 'should have a colon in the time' do
      expect(@station.get_created_at).to include(":")
    end

    it 'should have been created before this year' do
      expect(@station.year_created).to be <= 2018
    end

    it 'should not have been created more recently than it was cretaed' do
      expect(@station.compare_dates).to be true
    end

    it 'should have longitude between 180 and -180' do
      expect(@station.get_longitude).to be_between(-180,180)
    end

    it 'should have latitude between 180 and -180' do
      expect(@station.get_latitude).to be_within(180).of(0)
    end

    it 'should have altitude above zero' do
      expect(@station.get_altitude).to be >= 0
    end

    it 'should have TEST in external id' do
      expect(@station.get_external_id).to include("_TEST")
    end

    it 'should have Test Station in name' do
      expect(@station.get_name).to include("Test Station")
    end

    it 'should have external_id ending in a three digit number' do
      expect(@station.id_ends_in_number).to be_a Integer
    end

    it 'should have rank as an integer' do
      expect(@station.get_rank).to be_a Integer
    end

    it 'should have external id begin with the same letter as the name' do
      expect(@station.compare_id_and_name).to be true
    end


  end

end
