class Api::V1::WeatherController < ApplicationController
  def index
    location = params[:location]
    weather_info = WeatherFacade.new
    @weather = weather_info.get_weather_info(location)
    render json: WeatherSerializer.new(@weather)
  end
end
