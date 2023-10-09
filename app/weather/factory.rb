class Factory
  def build_weather_service
    client = WapiWeatherClient.new
    secondary_client = OwWeatherClient.new
    client_with_fallback = WeatherClientWithFallback.new(client, secondary_client)
    cached_client = CachedWeatherClient.new(client_with_fallback, Rails.cache, 30.seconds)
    WeatherService.new(cached_client, WeatherPresenter.new)
  end
end
