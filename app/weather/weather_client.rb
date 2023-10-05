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
    JSON.parse(Net::HTTP.get(uri))
  end
end