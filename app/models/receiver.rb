class Receiver < ApplicationRecord
  has_one :category
  has_one :residue
  
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :name, presence: true
  validates :category_id, presence: true
  

end
