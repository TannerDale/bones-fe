class DogsController < ApplicationController
  def index
    @page = params[:page]&.to_i || 1
    dogs = DogFacade.dogs(@page)
    @dogs = DogSerializer.new(dogs)

    respond_to do |f|
      f.html
      f.json { render json: { dogs: @dogs } }
    end
  end

  def show
    @dog = DogFacade.find_dog(params[:id])

  end

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
    params.permit(:name, :age, :breed, :size, :sex, :vaccinated, :trained, :description)
  end
end
