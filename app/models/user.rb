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
class User < ApplicationRecord

  has_secure_password

  validates_uniqueness_of :username
  validates_presence_of :last_name
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
  validates_presence_of :password_digest
  validates_uniqueness_of :password_reset_token, allow_nil: true
  validates_uniqueness_of :confirmation_token, allow_nil: true

  after_create :send_confirmation_email

  before_create do
    self.active = true
  end

  def send_confirmation_email
    confirmation_token = SecureRandom.urlsafe_base64
    update(confirmation_token: confirmation_token)

    UserMailer.confirmation_email(self).deliver_now
  end
end
