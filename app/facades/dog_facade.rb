class DogFacade
  class << self
    def create_dog(json)
      DogService.create_dog(json)
    end

    def dogs(page)
      DogService.fetch_dogs(page).map do |dog|
        DogPoro.new(dog)
      end
    end

    def user_dogs(id)
      DogService.user_dogs(id).map do |dog|
        DogPoro.new(dog)
      end
    end
  end
end
