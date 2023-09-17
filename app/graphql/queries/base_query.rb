module Queries
  class BaseQuery < GraphQL::Schema::Resolver
    include Authorizable
  end
end
