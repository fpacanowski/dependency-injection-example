require 'net/http'

class OwWeatherClient
  KELVIN_TO_CELSIUS_CONSTANT = -273

  def get_weather(lattitude, longitude)
    params = {
      lat: lattitude,
      lon: longitude,
      appid: '6cbf61a8174de57cee45a76704a7f443',
    }
    uri = URI::HTTPS.build(
      host: 'api.openweathermap.org',
      path: '/data/2.5/weather',
      query: params.to_query
    )
    response = JSON.parse(Net::HTTP.get(uri))
    Weather.new(
      cloud_cover: response.dig('clouds', 'all'),
      temperature: response.dig('main', 'temp') + KELVIN_TO_CELSIUS_CONSTANT,
    )
  end
end
