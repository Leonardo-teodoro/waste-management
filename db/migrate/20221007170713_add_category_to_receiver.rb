class AddCategoryToReceiver < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :receiver, index:true
  end
end
