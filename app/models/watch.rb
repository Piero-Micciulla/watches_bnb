class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :price, presence: true
  validates :brand, presence: true
  has_many_attached :photos
end
