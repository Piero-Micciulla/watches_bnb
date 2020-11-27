class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :user # not the owner, but the client
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :end_date_cannot_be_before_start_date


  def end_date_cannot_be_before_start_date
    if start_date && end_date
      if end_date < start_date
        errors.add(:end_date, "can't be before the start date")
      end
    end
  end
end
