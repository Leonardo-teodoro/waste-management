class AddUserToDiscards < ActiveRecord::Migration[7.0]
  def change
    add_reference :discards, :user, index:true
  end
end
