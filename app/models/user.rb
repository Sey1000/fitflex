class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # TODO: change this line once Instructor is added
  belongs_to :studio

  has_many :bookings
  has_many :reviews
  has_many :courses, through: :bookings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attachment: photo
end
