class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.integer :id, primary_key: true
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :active
      t.decimal :points
      t.boolean :email_confirmed
      t.string :password_reset_token
      t.string :confirmation_token

      t.timestamps
    end
  end
end
