class LocationsController < ApplicationController
  def index
    @page = params[:page]&.to_i || 1
    @locations = LocationFacade.nearby_locations(params[:location])
    cookies[:invited_dog] = params[:dog_id]
    # @locations = LocationSerializer.new(locations)
    #
    # respond_to do |f|
    #   f.html
    #   f.json { render json: { locations: @locations } }
    # end
  end
end
