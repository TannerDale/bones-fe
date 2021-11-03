class DogFacade
  class << self
    def create_dog(json)
      DogService.create_dog(json)
    end

    def dogs
      DogService.fetch_dogs.map do |dog|
        DogPoro.new(dog)
      end
    end
  end
end
