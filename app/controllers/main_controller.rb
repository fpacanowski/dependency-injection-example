class MainController < ApplicationController
  def index
    @lines = WeatherService.new.call
  end
end
