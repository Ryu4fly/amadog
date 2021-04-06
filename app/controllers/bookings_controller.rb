class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(booking_params)
    @booking.user = current_user
    @booking.walker = User.find(1)
  end

  def new
    @booking = Booking.new
    @user = current_user
    @booking.user = current_user
  end

  def create
    @user = current_user
    @booking = Booking.new(booking_params)
    @booking.user = current_user

    if @booking.save

      redirect_to user_bookings_path(@booking)
    else
      render :new
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end




  private

  def booking_params
    params.require(:booking).permit(:user_id, :walker_id, :booking_id)
  end
end
