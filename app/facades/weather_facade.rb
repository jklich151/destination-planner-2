class WeatherFacade
  def get_weather_info(location)
    service = WeatherService.new
    service_2 = ImageService.new
    weather_data = service.get_weather(location)
    summary = weather_data[:weather][0][:description]
    image_url = service_2.get_image_url(summary)
    Weather.new(weather_data, image_url)
  end
end
