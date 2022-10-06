class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :provider
      t.boolean :blocked
      t.datetime :confirmed_at
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
  
end
