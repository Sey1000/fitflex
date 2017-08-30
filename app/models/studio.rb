class Studio < ApplicationRecord
  has_many :users
  has_many :courses
  
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  # TODO: When we add Instructors, change association
end
