# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  account_type          :integer          default("NON_TECHIE")
#  active                :boolean          default(FALSE)
#  confirmation_token    :string
#  email                 :string           not null
#  email_confirmed       :boolean          default(FALSE)
#  first_name            :string
#  last_name             :string
#  password_digest       :string           not null
#  password_reset_token  :string
#  phone_number          :string
#  social_links          :jsonb
#  token_expiration_date :datetime
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:last_name) }
end
