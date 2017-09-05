class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :course

  validates :course, uniqueness: { scope: :user }

end
