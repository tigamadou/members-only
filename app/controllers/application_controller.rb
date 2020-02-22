class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token]) if session[:user_id]
  end

  def current_user=(user)
    @current_user = user
  end

  def sign_in(user)
    session[:user_id] = user.id
    user.update_token
    cookies.permanent[:remember_token] = user.remember_token
    current_user=(user)
  end

  def sign_out
    @current_user = nil
    cookies.permanent.delete(:remember_token)
    session.delete(:user_id)
  end

  def signed_in?
    !current_user.nil?
  end

  def required_sign_in
    return redirect_to sign_in_path flash[:danger] = 'You must be logged in to access this section' unless signed_in?
  end

  helper_method :signed_in?
end
