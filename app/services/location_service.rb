class LocationService
  class << self
    def nearby_locations(location)
      BackendClient.fetch("/api/v1/yelp_locations?location=#{location}")[:data]
    end

    def search_by_id(id)
      BackendClient.fetch("/api/v3/businesses/#{id}")
    end
  end
end
