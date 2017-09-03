class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :course, uniqueness: { scope: :user, message: "is already booked by user" }
  validates_with BookingCountValidator
end
