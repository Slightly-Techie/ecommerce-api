ActiveAdmin.register Product do

  permit_params :name, :price, :description, :specification, :in_stock, :category_list, :is_discounted, :discount_percentage, :published, images: []

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
    column :categories
    column :discount_percentage
    column :is_discounted

    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :price
      f.input :description
      f.input :specification
      f.input :category_list
      f.input :discount_percentage
      f.input :in_stock
      f.input :is_discounted
      f.input :published
      f.input :images, as: :file, input_html: { multiple: true }
    end
    f.actions
  end

end
