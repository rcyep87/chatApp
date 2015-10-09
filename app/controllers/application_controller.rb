class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user

  helper_method :current_user, :user_logged_in?

  def authenticate_user
    unless user_logged_in?
      redirect_to login_path
    end
  end

  def current_user #enables retrieval of user's session cookie as they visit different pages
    if user_logged_in?
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end


  def user_logged_in? #checks to see if newly registered user is logged in
    session[:user_id].present?
  end

end
