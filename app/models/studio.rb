class Studio < ApplicationRecord
  has_many :users
  has_many :courses
  # TODO: When we add Instructors, change association
end
