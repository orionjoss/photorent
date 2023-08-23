class Camera < ApplicationRecord
  belongs_to :user

  validates :brand, presence: true
  validates :camera_type, presence: true
  validates :address, presence: true
end
