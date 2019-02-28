class Booking < ApplicationRecord
  belongs_to :pair
  belongs_to :profile

  validates :status, presence: true
  validates :beginning_date, :end_date, presence: true
  validate :end_date_after_beginning_date

  private

  def end_date_after_beginning_date
    return if end_date.blank? || beginning_date.blank?

    if end_date < beginning_date
      errors.add(:end_date, "must be after the start date")
    end
 end

end
