require "rails_helper"

module Mutations
  RSpec.describe GraphqlController, type: :controller do
    describe "CreateUser mutation" do
      
      it "should create a user" do
        post :execute, params: { query: query }
        result = JSON.parse(response.body)

        user_data = data(result)
        expect(user_data["email"]).to eq("testing@gmail.com")

      end
    end

    def data(response)
      gql_response(response, "createUser")
    end

    def query
      <<~GQL
      mutation {
        createUser(
          input: {username: "testing", email: "testing@gmail.com", lastname: "testname", password: "password"}
        ) {
          user {
            id
            username
            lastname
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
