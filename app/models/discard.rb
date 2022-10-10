# @residue_id [Integer]
# @user_id [Integer]
# @description [String]
# @receiver_id [Integer]
# @date [Date]

class Discard < ApplicationRecord
  belongs_to :user
  belongs_to :residue
  belongs_to :receiver
  

end
