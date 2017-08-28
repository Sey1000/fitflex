class Studio < ApplicationRecord
  has_many :users, :courses #not yet belongs_to in users, need to add to child class?
end
