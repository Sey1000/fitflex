class Course < ApplicationRecord
  belongs_to :studio
  has_many :bookings, :reviews
end
