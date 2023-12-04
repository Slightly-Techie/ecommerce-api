class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :product
      t.belongs_to :order
      

      t.timestamps
    end
  end
end
