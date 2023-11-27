ActiveAdmin.register Product do

  permit_params :name, :price, :description, :specification, :in_stock, :published, images: []

  index do
    selectable_column
    id_column
    column :name
    column :price
    column :description do |product|
      truncate(product.description, length: 56)
    end
    column :in_stock
    column :published
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :specification
      f.input :in_stock
      f.input :published
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

end
