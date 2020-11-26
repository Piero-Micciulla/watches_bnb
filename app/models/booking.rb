class Booking < ApplicationRecord
  belongs_to :watch
  belongs_to :user # not the owner, but the client
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_mandatory
  unless defined?(start_date) || defined?(end_date)
    validate :end_date_cannot_be_before_start_date
  end

  def end_date_cannot_be_before_start_date
    if end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end

  def date_mandatory
    if start_date.nil? || end_date.nil?
      errors.add(:start_date, "must enter date")
    end
  end
end
