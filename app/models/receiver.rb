class Receiver < ApplicationRecord
  has_one :category
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true
  validates :name, presence: true

end
