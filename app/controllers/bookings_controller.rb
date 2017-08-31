class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @booking = Booking.new(bookings_params)
    if @booking.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.js
      end
    else
      @course = Course.find(bookings_params[:course_id])
      respond_to do |format|
        format.html { render 'courses/show' }
        format.js
      end
    end
  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
  end

  private

  def bookings_params
    params.require(:booking).permit(:course_id, :user_id)
  end
end
