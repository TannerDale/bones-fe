class DogFactService
  class << self
    def get_fact
      BackendClient.fetch("/api/v1/dog_facts")[:fact]
    end
  end
end
