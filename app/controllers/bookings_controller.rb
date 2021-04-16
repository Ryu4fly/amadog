class BookingsController < ApplicationController
  def index
    # @bookings = Booking.all
    @bookings = policy_scope(Booking)
    @user = current_user
    @markers = @flats.geocoded.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { booking: booking })
        # image_url: helpers.asset_url('to do: add image file from assets')
      }
    end
    if Rails.env.production?
      @country = request.location.country_code
      @city = request.location.city
    end
  end

  def show
    @booking = Booking.find(booking_params)
    @booking.user = current_user
    @booking.walker = User.find(booking_params)
    authorize @booking
  end

  def new
    @booking = Booking.new
    @user = current_user
    @booking.user = current_user
    @booking.pet =
      authorize @booking
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = current_user
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
end
