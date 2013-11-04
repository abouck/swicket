class UsersController < ApplicationController
    def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user].permit(:email, :password, :password_confirmation, :username))
    redirect_to root_url
  end

  def show
    @user = User.find(params[:id])
  end
end