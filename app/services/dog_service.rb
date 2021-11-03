class DogService
  class << self
    def create_dog(json)
      BackendClient.create_dog(json)
    end

    def fetch_dogs
      BackendClient.fetch('/api/v1/pets')[:data]
    end
  end
end
