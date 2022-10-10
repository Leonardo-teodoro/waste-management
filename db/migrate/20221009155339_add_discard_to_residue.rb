class AddDiscardToResidue < ActiveRecord::Migration[7.0]
  def change
    add_reference :discards, :residue, index:true
  end
end
