class Residue < ApplicationRecord
  has_one_attached :image, dependent: :destroy
  has_many :discards
  has_many :receivers, through: :discards

  
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :slug, uniqueness: true

end
