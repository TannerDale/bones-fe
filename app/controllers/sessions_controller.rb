class SessionsController < ApplicationController
  def create
    user = User.find_or_create_by(email: user_params[:email])
    user.update(user_params)

    session[:user_id] = user.id

    SessionsFacade.sign_in(auth_hash)

    redirect_to root_path
  end

  def destroy
    current_user.update_attribute(:token, nil)

    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_params
    {
      google_id: auth_hash['uid'],
      email: auth_hash['info']['email'],
      token: auth_hash['credentials']['token']
    }
  end
end
