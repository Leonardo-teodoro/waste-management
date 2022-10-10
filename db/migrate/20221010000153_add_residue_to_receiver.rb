class AddResidueToReceiver < ActiveRecord::Migration[7.0]
  def change
    add_reference :receivers, :residue, null: false, foreign_key: true
  end
end
