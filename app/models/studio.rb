class Studio < ApplicationRecord
  has_many :users, :courses
end
