class Review < ApplicationRecord
  belongs_to :course
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  validates :course, uniqueness: { scope: :user, message: "is already reviewed by user" }
end
