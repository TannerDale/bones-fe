class DogFacade
  class << self
    def create_dog(json)
      DogService.create_dog(json)
    end
  end
end
