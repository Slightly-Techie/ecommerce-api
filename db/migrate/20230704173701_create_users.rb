class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :username, null: false, unique: true, index: true
      t.string :email, null: false, unique: true, index: true
      t.string :password_digest, null: false
      t.boolean :active, default: false
      t.decimal :points, default: 0.0
      t.boolean :email_confirmed, default: false
      t.string :auth_token
      t.string :password_reset_token
      t.string :confirmation_token
      

      t.timestamps
    end
  end
end
