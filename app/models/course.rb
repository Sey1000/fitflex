class Course < ApplicationRecord
  belongs_to :studio
  has_many :reviews
  has_many :bookings
  has_many :users, through: :bookings



  def average_rating
    reviews= self.reviews
    ratings =[]
    sum = 0
    reviews.each do |r|
      ratings << r.rating
      sum += r.rating
    end
    ((sum/(ratings.length)).to_f)/5 *100
  end


end
