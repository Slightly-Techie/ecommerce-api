class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.integer :status, default: 0
      t.string :order_number
      t.datetime :completed_at
      t.datetime :canceled_at
      t.datetime :returned_at
      

      t.timestamps
    end
  end
end
