module Queries
  class Profile < BaseQuery
    type Types::UserType, null: true

    def resolve
      current_user
    end
  end
end
