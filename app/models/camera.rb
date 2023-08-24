class Camera < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :brand, presence: true
  validates :camera_type, presence: true
  validates :address, presence: true

  include PgSearch::Model
  pg_search_scope :global_search,
                  against: [ :brand, :camera_type ],
                  associated_against: {
                    user: [ :first_name, :last_name ]
                  },
                  using: {
                    tsearch: { prefix: true }
                  }
end
