class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    @bookings = policy_scope(Booking)
    @user = current_user
    @users = User.where(username: @user.username)
    @markers = markers
    # raise
    if Rails.env.production?
      @country = request.location.country_code
      @city = request.location.city
    end
  end

  def show
    @booking = Booking.find(params[:id])
    # @booking.user = current_user
    #@booking.walker = User.find(booking_params)
    @bookings = Booking.where(user_id: current_user.id, walker_id: @booking.walker_id)
    # @users = User.where(username: current_user.username)
    # @markers = markers
    @geocoder_result = request.location
    raise
    @booking_markers = booking_markers
    authorize @booking
  end

  def new
    @booking = Booking.new
    @user = User.find(params[:user_id])
    authorize @booking
  end

  def create
    @user = User.find(params[:user_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.walker = @user
    authorize @booking

    if @booking.save

      redirect_to user_bookings_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :walker_id, :booking_id, :pet, :date, :end_time, :starting_time, :address, :comment)
  end

  def markers
    @users.geocoded.map do |user|
      # if user != @user
        {
          lat: user.latitude,
          lng: user.longitude,
          infoWindow: render_to_string(partial: "info_window", locals: { user: user })
          # image_url: helpers.asset_url('optional: add image file from assets')
        }
      # end
    end
  end
  def booking_markers
    @bookings.geocoded.map do |booking|
        {
          lat: booking.latitude,
          lng: booking.longitude,
          # infoWindow: render_to_string(partial: "info_window", locals: { user: user })
          # image_url: helpers.asset_url('optional: add image file from assets')
        }
      # end
    end
  end
end
