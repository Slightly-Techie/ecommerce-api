module Types
  class MutationType < Types::BaseObject
    field :create_user, Types::UserType, null: true
  end
end
