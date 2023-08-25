class Camera < ApplicationRecord
  belongs_to :user
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  has_many :bookings, dependent: :destroy
  has_one_attached :photo
  # has_many_attached :photos

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
