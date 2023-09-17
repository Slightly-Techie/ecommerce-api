class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username, null: false, unique: true, index: true
      t.string :email, null: false, unique: true, index: true
      t.integer :account_type, default: 0
      t.string :password_digest, null: false
      t.string :phone_number
      t.jsonb :social_links
      t.boolean :active, default: false
      t.boolean :email_confirmed, default: false
      t.string :password_reset_token
      t.datetime :token_expiration_date
      t.string :confirmation_token

      t.timestamps
    end
  end
end
