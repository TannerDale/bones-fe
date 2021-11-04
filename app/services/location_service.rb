class LocationService
  class << self
    def nearby_locations(location)
      BackendClient.fetch("/api/v1/yelp_locations?location=#{location}")[:data]
    end
  end
end
