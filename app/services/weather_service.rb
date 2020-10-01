class WeatherService

  def get_weather(city)
    response = conn.get("weather?q=#{city}")
    parsed_json(response)
  end

  def conn
    Faraday.new(url: "https://api.openweathermap.org/data/2.5") do |faraday|
      faraday.params["appid"] = ENV["WEATHER_KEY"]
    end
  end

  def parsed_json(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
