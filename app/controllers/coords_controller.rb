require 'open-uri'
require 'json'

class CoordsController < ApplicationController
  def fetch_weather

if  params[:address]== nil
        @address="the corner of foster and sheridan"
    else
    @address = params[:address]
end
    @url_safe_address = URI.encode(@address)

    # Your code goes here.
    url1 = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data1 = open(url1).read
    parsed_data1 = JSON.parse(raw_data1)
    @latitude = parsed_data1["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data1["results"][0]["geometry"]["location"]["lng"]


    # @latitude = 42.0538387
    # @longitude = -87.67721
    your_api_key = "0a055fe365fc1bb1923169ac11dfac1a"


    url = "https://api.forecast.io/forecast/" + your_api_key + "/" + @latitude.to_s + "," + @longitude.to_s
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]

  end
end
