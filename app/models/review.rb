class Review < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :course, uniqueness: { scope: :user, message: "is already reviewed by user" }
end
