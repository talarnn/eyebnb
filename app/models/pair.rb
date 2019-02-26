class Pair < ApplicationRecord
  belongs_to :profile

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true
  validates :profile_id, presence: true

  validates :correction_type, presence: true, inclusion: { in: ["Presbyopia", "Short sightedness", "Astigmatic", "Farsightedness"] }
  validates :right_eye_correction, presence: true
  validates :left_eye_correction, presence: true
end
