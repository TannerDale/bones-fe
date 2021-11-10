class LocationFacade
  class << self
    def nearby_locations(location)
      LocationService.nearby_locations(location).map do |local|
        LocationPoro.new(local)
      end
    end

    def search_by_id(id)
      location = LocationService.search_by_id(id)
      LocationPoro.new(location)
    end
  end
end
