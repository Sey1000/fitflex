class Course < ApplicationRecord
  belongs_to :studio
  has_many :reviews
  has_many :bookings
  has_many :users, through: :bookings
end
