require 'net/http'

class WeatherClient
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
    response = JSON.parse(Net::HTTP.get(uri))
    Weather.new(
      cloud_cover: response.dig('current', 'cloud'),
      temperature: response.dig('current', 'temp_c'),
    )
  end
end
