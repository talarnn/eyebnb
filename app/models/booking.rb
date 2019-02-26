class Booking < ApplicationRecord
  belongs_to :pair
  belongs_to :profile

  validates :status, presence: true
  validates :beginning_date, presence: true
  validates :end_date, presence: true
end
