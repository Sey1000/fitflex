class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(bookings_params)
    @booking.save
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
  end

  private

  def bookings_params
    params.require(:booking).permit(:course_id, :user_id)
  end
end
