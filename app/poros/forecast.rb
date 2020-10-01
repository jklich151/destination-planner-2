class Forecast
  attr_reader :current_temp,
              :high_temp,
              :low_temp,
              :summary,
              :date,
              :id

  def initialize(weather_data)
    @current_temp = weather_data[:main][:temp]
    @high_temp = weather_data[:main][:temp_max]
    @low_temp = weather_data[:main][:temp_min]
    @summary = weather_data[:weather][0][:description]
    @date = Time.now
    @id = 123
  end
end
