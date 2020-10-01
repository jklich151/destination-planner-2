class WeatherSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :current_temp, :high_temp, :low_temp, :summary, :date, :image
end
