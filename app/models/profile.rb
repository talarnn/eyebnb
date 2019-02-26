class Profile < ApplicationRecord
  has_many :pairs, dependent: :destroy
  belongs_to :user

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tel, numericality: true
end
