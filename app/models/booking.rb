class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :course, uniqueness: { scope: :user, message: "is already booked by user" }

  before_validation :check_booking_count

  private

  def check_booking_count
    
  end
end
