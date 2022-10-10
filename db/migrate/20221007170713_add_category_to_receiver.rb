class AddCategoryToReceiver < ActiveRecord::Migration[7.0]
  def change
    add_reference :receivers, :category, index:true
  end
end
