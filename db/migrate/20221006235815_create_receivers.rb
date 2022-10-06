class CreateReceivers < ActiveRecord::Migration[7.0]
  def change
    create_table :receivers do |t|
      t.string :name
      t.string :email
      t.boolean :condition
      t.boolean :truly_linfo
      t.integer :cep
      t.string :state
      t.string :city
      t.string :street
      t.integer :number
      t.string :complement
      t.boolean :approved
      t.string :link

      t.timestamps
    end
  end
end
