# == Schema Information
#
# Table name: users
#
#  id                   :integer          not null, primary key
#  active               :boolean
#  confirmation_token   :string
#  email                :string
#  email_confirmed      :boolean
#  last_name            :string
#  other_names          :string
#  password_digest      :string
#  password_reset_token :string
#  points               :decimal(, )
#  username             :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:last_name) }
end