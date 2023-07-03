class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :phone
      t.string :password_digest
      t.string :role
      t.integer :seller_id
      t.integer :buyer_id

      t.timestamps
    end
  end
end
