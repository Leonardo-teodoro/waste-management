class CreateResidues < ActiveRecord::Migration[7.0]
  def change
    create_table :residues do |t|
      t.string :title
      t.string :subtitle
      t.text :content
      t.text :description
      t.string :link
      t.string :buttonContent
      t.string :slug

      t.timestamps
    end
  end
end
