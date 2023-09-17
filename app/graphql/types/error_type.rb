module Types
  class ErrorType < Types::BaseObject
    field :property, String, null: false
    field :message, String, null: true
  end
end
