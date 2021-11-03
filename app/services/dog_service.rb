class DogService
  class << self
    def create_dog(json)
      BackendClient.create_dog(json)
    end
  end
end
