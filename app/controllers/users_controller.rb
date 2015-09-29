class UsersController < ApplicationController
  before_action :authorize_user, only: [:index]
  def index
    @users = User.all
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
end
