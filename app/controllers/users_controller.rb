class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(user_params[:id])
    authorize @user
  end

  def user_params
    params.permit(:id)
  end
end
