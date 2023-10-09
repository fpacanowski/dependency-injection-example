class WeatherClientWithFallback
  def initialize(primary_client, secondary_client)
    @primary_client = primary_client
    @secondary_client = secondary_client
  end

  def get_weather(longitude, latitude)
    begin
      @primary_client.get_weather(longitude, latitude)
    rescue => e
      puts e
      puts '*** PRIMARY CLIENT FAILED, USING FALLBACK'
      @secondary_client.get_weather(longitude, latitude)
    end
  end
end
