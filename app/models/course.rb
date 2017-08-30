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
    (sum.to_f / (ratings.length)) / 5 *100
  end

  # def day
  #   datetime = start_time
  #   if datetime.today?
  #     "Today"
  #   elsif datetime == Date.tomorrow
  #     "Tomorrow"
  #   elsif datetime < (DateTime.now + 7.day)
  #     days = datetime.day - DateTime.now.day
  #     "#{days} days"
  #   end
  # end

  # def day=(value)
  # end
end
