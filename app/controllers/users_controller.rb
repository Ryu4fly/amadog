class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(user_params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    @pets = ["Dog1", "Dog2", "Dog3"]
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.permit(:id)
  end
end
