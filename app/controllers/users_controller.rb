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
    @user = User.update(current_user, user_params)
    if @user.save
      flash[:notice] = "User info updated"
      redirect_to @user
    else
      flash[:errors] = @user.errors.full_messages.join(" | ")
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:alert] = "User deleted"
    redirect_to users_path
  end

  def authorize_user
    unless current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def user_params
    params.require(:user).permit(:email)
  end
end
