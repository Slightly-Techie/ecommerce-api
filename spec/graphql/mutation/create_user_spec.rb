require "rails_helper"

module Mutations
  RSpec.describe GraphqlController, type: :controller do
    describe "CreateUser mutation" do
      
      it "should create a user" do
        post :execute, params: { query: query("testing","testing@gmail.com","testname", "Kay","password") }

        user_data = data(response)

        expect(user_data["user"]["email"]).to eq("testing@gmail.com")
        expect(user_data["user"]["username"]).to eq("testing")
      end

      it "should not create a user with validation errors" do
        post :execute, params: { query: query("testing","email","", "Kay","password") }

        user_data = data(response)
        expect(user_data["errors"]).to eq(["{:property=>:last_name, :message=>\"can't be blank\"}", "{:property=>:email, :message=>\"is invalid\"}"])
      
      end
    end

    def data(response)
      gql_response(response, "createUser")
    end

    def query(username, email, last_name, other_names, password)
      <<~GQL
      mutation {
        createUser(
          input: {username: "#{username}", email: "#{email}", lastName: "#{last_name}", otherNames: "#{other_names}", password: "#{password}"}
        ) {
          user {
            id
            username
            lastName
            otherNames
            email
            active
            points
            emailConfirmed
            passwordResetToken
            confirmationToken
          }
          errors
        }
      }      
      GQL
    end
  end
end
