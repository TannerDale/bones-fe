class LocationsController < ApplicationController

  def index
    @locations = LocationPoro.all
  end
end
