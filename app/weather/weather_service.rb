class WeatherService
  def initialize
    @weather_client = WeatherClient.new
  end

  def call(locations)
    locations.map do |city, coords|
      weather = @weather_client.get_weather(*coords)
      "Weather in #{city}: #{present(weather)}"
    end
  end

  private

  def present(weather)
    cloud_cover = weather.dig('current', 'cloud')
    temperature = weather.dig('current', 'temp_c')
    cloud_text =
      if cloud_cover <= 20
        'clear'
      elsif cloud_cover <= 70
        'partially clouded'
      else
        'clouded'
      end
    formatted_temperature = format('%.1f', temperature)
    "the sky is #{cloud_text} (#{cloud_cover}% clouds) and the temperature is #{formatted_temperature} C"
  end
end
