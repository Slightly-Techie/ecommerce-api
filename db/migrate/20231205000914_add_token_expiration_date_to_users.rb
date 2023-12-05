class AddTokenExpirationDateToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :token_expiration_date, :datetime
  end
end
