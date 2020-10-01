class Weather
  attr_reader :current_temp,
              :high_temp,
              :low_temp,
              :summary,
              :date,
              :id,
              :image

  def initialize(weather_data, image_url)
    @current_temp = weather_data[:main][:temp]
    @high_temp = weather_data[:main][:temp_max]
    @low_temp = weather_data[:main][:temp_min]
    @summary = weather_data[:weather][0][:description]
    @date = Time.now
    @id = 123
    @image = image_url
  end
end
