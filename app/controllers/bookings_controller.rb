class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    # @booking = Booking.where(state: 'paid').find(params[:id])
  end

  def create
    # @booking = Booking.new(bookings_params)
    # if @booking.save
    #   respond_to do |format|
    #     format.html { redirect_to user_path(current_user) }
    #     format.js
    #   end
    # else
    #   @course = Course.find(bookings_params[:course_id])
    #   respond_to do |format|
    #     format.html { render 'courses/show' }
    #     format.js
    #   end
    # end

    # @course = Course.find(params[:course_id])
    # @studio = @course.studio
    # @booking = Booking.new(amount: @course.price, state: 'pending', course: @course, user: current_user)
    # if @booking.save
    #   redirect_to new_booking_payment_path(@booking)
    # else
    #   render 'courses/show'
    # end

    @course = Course.find(params[:booking][:course_id])
    @studio = @course.studio
    @booking = Booking.new(amount: @course.price, state: 'pending', course: @course, user: current_user)
    if @booking.valid?
      respond_to do |format|
        format.html { redirect_to new_course_payment_path(@course) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'courses/show' }
        format.js
      end
    end

  end

  def destroy
    @booking = Booking.find(params[:id]).destroy
    redirect_to user_path(current_user)
  end


end
