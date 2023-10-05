class WeatherService
  def initialize(weather_client)
    @weather_client = weather_client
  end

  def call(locations)
    locations.map do |city, coords|
      weather = @weather_client.get_weather(*coords)
      "Weather in #{city}: #{present(weather)}"
    end
  end

  private

  def present(weather)
    cloud_text =
      if weather.cloud_cover <= 20
        'clear'
      elsif weather.cloud_cover <= 70
        'partially clouded'
      else
        'clouded'
      end
    formatted_temperature = format('%.1f', weather.temperature)
    "the sky is #{cloud_text} (#{weather.cloud_cover}% clouds) and the temperature is #{formatted_temperature} C"
  end
end
