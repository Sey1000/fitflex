class Studio < ApplicationRecord
  has_many :users
  has_many :courses

  validates :address, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_attachment :photo
  # TODO: When we add Instructors, change association

end
