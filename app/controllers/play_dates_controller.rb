class PlayDatesController < ApplicationController
  def new
    session[:playdate_dog_id] = params[:dog_id]
  end
end
