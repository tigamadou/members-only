class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def sign_in(user)
    session[:user_id] = user.id
    user.update_token
    cookies.permanent[:remember_token] = user.remember_token
    set_current_user user
  end

  def sign_out
    @current_user=nil
    cookies.permanent.delete(:remember_token)
    session.delete(:user_id)
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(remember_token: cookies.permanent[:remember_token])
    end
  end

  def set_current_user(user)
    @current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def required_sign_in
    unless signed_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to sign_in_path
    end
  end

  helper_method :signed_in?
end
