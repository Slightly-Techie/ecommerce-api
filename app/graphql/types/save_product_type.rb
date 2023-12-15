module Types
  class SaveProductType < Types::BaseObject
    field :id, ID, null: false
    field :product, Types::ProductType, null: false
  end
end

