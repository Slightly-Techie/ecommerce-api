class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :active, default: false
      t.decimal :points, default: 0
      t.boolean :email_confirmed, default: false
      t.string :password_reset_token
      t.string :confirmation_token

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :password_reset_token, unique: true
    add_index :users, :confirmation_token, unique: true
  end
end
