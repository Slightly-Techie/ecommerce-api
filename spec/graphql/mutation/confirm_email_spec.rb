require "rails_helper"

module Mutations
  RSpec.describe ConfirmEmail, type: :mutation do
    describe "resolve" do
      let(:user) { create(:user, confirmation_token: "abcd1234") }

      it "confirms user's email with valid token" do
        result = perform(token: user.confirmation_token)
        
        expect(result[:success]).to be true
        expect(result[:errors]).to be_empty
      end

      it "returns an error with invalid token" do
        result = perform(token: "invalid_token")
        
        expect(result[:success]).to be false
        expect(result[:errors]).to contain_exactly("Invalid confirmation token")
      end

      it "returns an error if user is not found" do
        result = perform(token: "abcd1234")
        
        expect(result[:success]).to be false
        expect(result[:errors]).to contain_exactly("User not found")
      end
    end

    def perform(token:)
      described_class.new(object: nil, context: {}).resolve(token: token)
    end
  end
end
