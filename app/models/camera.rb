class Camera < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :brand, presence: true
  validates :camera_type, presence: true
  validates :address, presence: true

end
