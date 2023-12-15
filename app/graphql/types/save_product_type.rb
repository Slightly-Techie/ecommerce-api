module Types
  class SavedProductType < Types::BaseObject
    field :id, ID, null: false
    field :product, Types::ProductType, null: false
  end
end

