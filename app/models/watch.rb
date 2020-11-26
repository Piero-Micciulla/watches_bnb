class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :price, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [:brand, :description],
    using: {
      tsearch: { prefix: true }
    }
end
