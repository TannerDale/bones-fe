class LocationFacade
  class << self
    def nearby_locations(location)
      LocationService.nearby_locations(location).map do |local|
        LocationPoro.new(local)
      end
    end

    def find_by_id(location)


    end
  end
end
