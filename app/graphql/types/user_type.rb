class Types::UserType < Types::BaseObject
  field :id, Int, null: false
  field :username, String, null: false
  field :email, String, null: false
  field :other_names, String, null: true
  field :last_name, String, null: false
  field :points, Float, null: true
end