class SessionsController < ApplicationController
  skip_before_filter :authenticate_user

  def new #login page
  end

  def create #create the login session
    user = User.find_by_username(params[:username])
    if user.present? && user.authenticate(params[:password])
      set_user_session(user) #creates temporary cookie
      redirect_to root_path, notice: "Successfully logged in!"
    else
      flash[:alert] = "Username or Password did not match"
      render :new
    end
  end

  def destroy #delete login session (logout)
    session[:logged_in_user_id] = nil
    redirect_to root_path, notice: "Successfully logged out."
  end

  private

  def set_user_session(user) #places temporary cookie on client browser
    session[:logged_in_user_id] = user.id
  end
end
