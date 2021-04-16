class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user })
        # image_url: helpers.asset_url('to do: add image file from assets')
      }
  end

  def show
    @user = User.find(params[:id])
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
    params.require(:user).permit(:id, :bio, :username, :address, :pet)
  end
end
