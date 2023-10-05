require 'net/http'

class WeatherService
  def call(locations)
    locations.map do |city, coords|
      weather = get_weather(*coords)
      "Weather in #{city}: #{present(weather)}"
    end
  end

  private

  def get_weather(lattitude, longitude)
    params = {
      q: [lattitude, longitude].join(','),
      key: 'efa873646d8043d39c5153004232609',
    }
    uri = URI::HTTP.build(
      host: 'api.weatherapi.com',
      path: '/v1/current.json',
      query: params.to_query
    )
    JSON.parse(Net::HTTP.get(uri))
  end

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
