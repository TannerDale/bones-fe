class DogService
  class << self
    def create_dog(json)
      BackendClient.create_dog(json)
    end

    def fetch_dogs(page)
      BackendClient.fetch("/api/v1/pets?page=#{page}")[:data]
    end

    def user_dogs(id)
      BackendClient.fetch("/api/v1/user_pets?user_id=#{id}")[:data]
    end
  end
end
