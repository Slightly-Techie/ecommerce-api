# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  active               :boolean          default(FALSE)
#  confirmation_token   :string
#  email                :string           not null
#  email_confirmed      :boolean          default(FALSE)
#  first_name           :string           not null
#  last_name            :string           not null
#  password_digest      :string           not null
#  password_reset_token :string
#  points               :decimal(, )      default(0.0)
#  username             :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_users_on_email     (email)
#  index_users_on_username  (username)
#
class User < ApplicationRecord
  has_secure_password

  validates :username, uniqueness: true, presence: true
  validates :first_name, :last_name, presence: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email

  after_create :send_confirmation_email

  def send_confirmation_email
    update(confirmation_token: rand(000000..999999))
    UserMailer.welcome_mail(self).deliver_now
  end

  def send_password_reset_email
    self.update!(password_reset_token: rand(000000..999999))

    UserMailer.forgot_password_mail(self).deliver_now
  end
end

