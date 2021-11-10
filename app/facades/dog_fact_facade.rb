class DogFactFacade
  class << self
    def get_fact
      DogFactService.get_fact
    end
  end
end
