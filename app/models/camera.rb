class Camera < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  # has_many_attached :photos

  validates :brand, presence: true
  validates :camera_type, presence: true
  validates :address, presence: true
end
