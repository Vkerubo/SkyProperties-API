class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.string :title
      t.string :address
      t.integer :price
      t.string :image
      t.integer :bedrooms
      t.integer :bathrooms
      t.references :seller, null: false, foreign_key: true

      t.timestamps
    end
  end
end
