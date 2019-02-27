class Profile < ApplicationRecord
  has_many :pairs, dependent: :destroy
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tel, numericality: true

  mount_uploader :profile_pic, PhotoUploader # enables image upload
end
