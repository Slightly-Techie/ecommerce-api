module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :profile, resolver: Queries::Profile
    field :products, resolver: Queries::Products
    field :fetch_product, resolver: Queries::FetchProduct
  end
end
