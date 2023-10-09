class WeatherPresenter
  def present(city, weather)
    cloud_text =
      if weather.cloud_cover <= 20
        'clear'
      elsif weather.cloud_cover <= 70
        'partially clouded'
      else
        'clouded'
      end
    formatted_temperature = format('%.1f', weather.temperature)
    "Weather in #{city}: the sky is #{cloud_text} (#{weather.cloud_cover}% clouds)" +
    " and the temperature is #{formatted_temperature} C"
  end
end
