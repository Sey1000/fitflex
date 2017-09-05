class PaymentsController < ApplicationController
  before_action :set_course

  def new

  end

  def create
    customer = Stripe::Customer.create(
    source: params[:stripeToken],
    email:  params[:stripeEmail]
    )

    charge = Stripe::Charge.create(
    customer:     customer.id,   # You should store this customer id and re-use it.
    amount:       @course.price_cents,
    description:  "Payment for Course #{@course.title}",
    currency:     @course.price.currency
    )

    @booking = Booking.create!(amount: @course.price, state: 'paid', course: @course, user: current_user, payment: charge.to_json)
    redirect_to user_path(current_user)

    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_booking_payment_path(@booking)
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end
end
