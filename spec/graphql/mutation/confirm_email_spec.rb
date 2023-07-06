require "rails_helper"

module Mutations
  RSpec.describe GraphqlController, type: :controller do
    describe "Confirm user email" do
      let(:user) { create(:user, confirmation_token: "abcd1234") }

      it "confirms user's email with valid token" do
        post :execute, params: { query: query(user.confirmation_token) }

        result = data(response)
        expect(result["success"]).to be true
        expect(user.reload.email_confirmed).to be true
        
      end

      it "returns an error with invalid token" do
        post :execute, params: { query: query("invalid") }

        result = data(response)
        expect(result["success"]).to be false
        expect(result["errors"]).to eq(["Invalid Token"])
      end
    end

    def data(response)
      gql_response(response, "confirmEmail")
    end

    def query(token)
      <<~GQL
      mutation {
        confirmEmail(
          input: {token: "#{token}"}
        ) {
          success
          errors
        }
      }      
      GQL
    end
  end
end

