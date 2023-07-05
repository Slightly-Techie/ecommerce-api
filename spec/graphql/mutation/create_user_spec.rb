require "rails_helper"

module Mutations
  RSpec.describe GraphqlController, type: :controller do
    describe "CreateUser mutation" do
      
      it "should create a user" do
    


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
