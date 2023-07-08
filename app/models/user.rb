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
  require 'bcrypt'

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password_digest, presence: true
  validates :password_reset_token, uniqueness: true, allow_nil: true
  validates :confirmation_token, uniqueness: true, allow_nil: true

  after_create :send_confirmation_email

  private

  def confirm_email(confirmation_token)
    if self.confirmation_token == confirmation_token
      update(email_confirmed: true, confirmation_token: nil)
      true
    else
      false
    end
  end

  private

  def send_confirmation_email
    confirmation_token = SecureRandom.urlsafe_base64
    update(confirmation_token: confirmation_token)

    UserMailer.confirmation_email(self).deliver_now
  end

  def send_password_reset_email
    
  end
end
