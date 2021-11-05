class PlayDatesController < ApplicationController
  def new
    @user_dogs = DogFacade.user_dogs(current_user.id)
    @location = params[:location_id]
  end

  def create
    json = PlayDateSerializer.new(playdate_params.merge({ invited_dog_id: cookies[:invited_dog] }))
    PlayDateFacade.create_play_date(json)

    clear_invited_dog
    redirect_to dashboard_path
  end

  private

  def playdate_params
    params.permit(:date, :time, :creator_dog_id, :location_id)
  end

  def clear_invited_dog
    cookies.delete(:invited_dog)
  end
end
