class Factory
  def build_weather_service
    client = WapiWeatherClient.new
    cached_client = CachedWeatherClient.new(client, Rails.cache, 30.seconds)
    WeatherService.new(cached_client)
  end
end
