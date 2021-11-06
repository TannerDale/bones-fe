class PlayDatesController < ApplicationController
  before_action :validate_params, only: :create

  def new
    @user_dogs = DogFacade.user_dogs(current_user.id)
    @location = params[:location_id]
  end

  def create
    json = PlayDateSerializer.new(playdate_params.merge({ invited_dog_id: cookies[:invited_dog] }))
    PlayDateFacade.create_play_date(json.to_json)

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

  def valid_date?
    params[:date].present? && Date.today < Date.parse(params[:date])
  end

  def required_params?
    params[:date].present? && params[:time].present? && params[:creator_dog_id].present?
  end

  def validate_params
    if !(valid_date? && required_params?)
      redirect_to new_play_date_path, alert: 'Invalid params'
    end
  end
end
