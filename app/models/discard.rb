class Discard < ApplicationRecord
  belongs_to :user
  belongs_to :residue
  belongs_to :receiver
  

end
