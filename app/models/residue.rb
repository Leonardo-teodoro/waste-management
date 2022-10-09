class Residue < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  validates :title, presence: true
  validates :subtitle, presence: true

end
