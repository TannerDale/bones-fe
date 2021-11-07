class LocationFacade
  class << self
    def nearby_locations(location = 'Denver')
      LocationService.nearby_locations(location).map do |local|
        LocationPoro.new(local)
      end
    end
  end
end
