class ApplicationController < ActionController::Base
  helper_method :current_user
  add_flash_types :notice, :danger, :success

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def validate_user
    permission_denied unless current_user
  end

  def permission_denied
    redirect_to root_path, alert: 'Please login or sign up.'
  end
end
