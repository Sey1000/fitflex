class Instructor < ApplicationRecord
  belongs_to :studio
  has_many :courses
  has_many :areas
end
