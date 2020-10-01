class DestinationFacade

  def get_forecast(city)
    service = WeatherService.new
    weather_data = service.get_weather(city)
    Forecast.new(weather_data)
  end

  def get_image(summary)
    service = ImageService.new
    image_url = service.get_image_url(summary)
    image_url[:data][0][:images][:original][:url]
  end
end
