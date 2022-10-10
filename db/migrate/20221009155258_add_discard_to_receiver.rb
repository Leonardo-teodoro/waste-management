class AddDiscardToReceiver < ActiveRecord::Migration[7.0]
  def change
    add_reference :discards, :receiver, index:true
  end
end
