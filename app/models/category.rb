# @name [String]

class Category < ApplicationRecord
  has_many :receivers
end
