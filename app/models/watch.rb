class Watch < ApplicationRecord
  belongs_to :user
  belongs_to :material
  has_many :bookings, dependent: :destroy
  validates :price, presence: true
  validates :brand, presence: true
  validates :description, presence: true
  has_many_attached :photos
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
