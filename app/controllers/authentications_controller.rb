class AuthenticationsController < ApplicationController

  def new
    # Are they already logged in?
    if current_user # They are! Can't create them again.
      redirect_to root_url
    else
      @user = User.new

      render :new
    end
  end

  def create
    user = User.find_by(email: params[:user][:email])
    if user
      # Authenticate User
      if user.authenticate(params[:user][:password])
        session[:user_id] = user.id
        redirect_to root_url
      else
        flash.now.alert = "Unable to sign you in."
        render :new
      end
    end
  end

   def destroy
    session[:user_id] = nil
    flash[:notice] = "You signed out."
    redirect_to root_url
  end

end