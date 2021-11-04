class UsersController < ApplicationController
  before_action :validate_user

  def show
    dogs = DogFacade.user_dogs(current_user.id)
    @dogs = DogSerializer.new(dogs)
  end
end
