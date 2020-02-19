class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def sign_in(user)
    session[:user_id] = user.id
    user.update_token
    cookies.permanent[:remember_token] = user.remember_token
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  def current_user(user)

  end
end
