class CachedWeatherClient
    def initialize(weather_client, cache, ttl)
      @weather_client = weather_client
      @cache = cache
      @ttl = ttl
    end

    def get_weather(longitude, lattitude)
      @cache.fetch("weather_#{longitude}_#{lattitude}", expires_in: @ttl) do
        @weather_client.get_weather(longitude, lattitude)
      end
    end
  end
