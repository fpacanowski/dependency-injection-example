class MainController < ApplicationController
  def index
    @lines = weather_service.call([
      ['Wroclaw', [51.11, 17.02]],
      ['Warsaw', [52.23, 21.01]],
      ['Rzeszow', [50.03, 22.00]],
    ])
  end

  private

  def weather_service
    Factory.new.build_weather_service
  end
end
