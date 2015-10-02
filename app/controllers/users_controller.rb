class UsersController < ApplicationController
  before_action :authorize_user, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      flash[:info] = "User info updated"
      redirect_to @user
    else
      flash[:warning] = "Form errors"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:info] = "User deleted"
    redirect_to users_path
  end

  def authorize_user
    unless current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def user_params
    params.require(:user).permit(:email, :profile_photo)
  end
end
