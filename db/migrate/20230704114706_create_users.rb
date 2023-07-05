class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :password_digest
      t.boolean :active
      t.decimal :points, default: 0
      t.string :email_confirmed
      t.string :password_reset_token
      t.string :confirmation_token

      t.timestamps
    end
  end
end
