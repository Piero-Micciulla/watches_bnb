class Watch < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :price, presence: true
  validates :brand, presence: true
end
