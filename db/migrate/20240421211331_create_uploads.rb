class CreateUploads < ActiveRecord::Migration[7.1]
  def change
    create_table :uploads, id: :uuid do |t|
      t.string :key
      t.string :name
      t.string :extension
      t.string :plublic_id
      t.integer :total_bytes

      # Polymorphic association
      t.uuid :uploadable_id
      t.string :uploadable_type

      t.timestamps
    end

    add_index :uploads, %i[uploadable_type uploadable_id], name: 'index_uploads_on_uploadable'
  end
end
