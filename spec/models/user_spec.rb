# == Schema Information
#
# Table name: users
#
#  id                    :bigint           not null, primary key
#  active                :boolean          default(FALSE)
#  confirmation_token    :string
#  email                 :string           not null
#  email_confirmed       :boolean          default(FALSE)
#  last_name             :string
#  other_names           :string
#  password_digest       :string           not null
#  password_reset_token  :string
#  points                :decimal(, )      default(0.0)
#  token_expiration_date :datetime
#  username              :string           not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_password_reset_token  (password_reset_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:last_name) }
end
