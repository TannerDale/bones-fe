class DogsController < ApplicationController
  def index; end

  def show; end

  def new; end

  def create
    json = DogSerializer.new(dog_params.merge({ user_id: current_user.id })).to_json
    DogFacade.create_dog(json)

    redirect_to dashboard_path, success: 'Dog Created'
  end

  def edit; end

  def update; end

  def delete; end

  private

  def dog_params
    params.permit(:name, :age, :breed, :size, :sex, :vaccinated, :trained)
  end
end
