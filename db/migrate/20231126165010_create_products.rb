class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.text :description
      t.text :specification
      t.integer :views_count, default: 0
      t.text :categories, array: true, default: []
      t.decimal :discount_percentage
      t.boolean :is_discounted, default: false, null: false
      t.boolean :in_stock, default: false, null: false
      t.boolean :published, default: false, null: false

      t.timestamps
    end
  end
end
