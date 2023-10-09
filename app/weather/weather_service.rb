class WeatherService
  def initialize(weather_client, weather_presenter)
    @weather_client = weather_client
    @weather_presenter = weather_presenter
  end

  def call(locations)
    locations.map do |city, coords|
      weather = @weather_client.get_weather(*coords)
      @weather_presenter.present(city, weather)
    end
  end
end
