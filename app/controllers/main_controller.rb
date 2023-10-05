class MainController < ApplicationController
  def index
    @lines = WeatherService.new.call([
      ['Wroclaw', [51.11, 17.02]],
      ['Warsaw', [52.23, 21.01]],
      ['Rzeszow', [50.03, 22.00]],
    ])
  end
end
