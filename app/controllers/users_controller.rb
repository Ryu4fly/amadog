class UsersController < ApplicationController
  def index
    @users = policy_scope(User)
    @markers = markers
  end

  def show
    @user = User.find(params[:id])
    # @marker = markers
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

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  private

  def user_params
    params.require(:user).permit(:id, :bio, :avatar, :username, :address, :pet)
  end

  def markers
    if !@users.nil?
      @users.geocoded.map do |user|
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user })
          # image_url: helpers.asset_url('optional: add image file from assets')
        }
      end
    #else
    #  @user.geocode.map do |user|
    #    {
    #      lat: user.first,
    #      lng: user.last,
    #      infoWindow: render_to_string(partial: "info_window", locals: { user: user })
          # image_url: helpers.asset_url('optional: add image file from assets')
    #    }
    #  end
    end
  end
end
