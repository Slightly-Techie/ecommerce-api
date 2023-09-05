require "rails_helper"

module Mutations
    RSpec.describe Mutations::Login do
        let(:user) { create(:user) }

        it 'should login a user' do
            query = <<~GQL
            mutation {
                login(
                    input: {email: "#{user.email}", password: "#{user.password}"}
                ) {
                    token
                }
            }
            GQL

            result = EcommerceApiSchema.execute(query: query)
            expect(result.dig("data", "login", "token")).to be_present
        end

        it 'should not login a user with invalid credentials' do
            query = <<~GQL
            mutation {
                login(
                    input: {email: "#{user.email}", password: "wrong_password"}
                ) {
                    token
                }
            }
            GQL

            result = EcommerceApiSchema.execute(query: query)
            expect(result.dig("data", "login", "token")).to be_nil
        end
    end
end
