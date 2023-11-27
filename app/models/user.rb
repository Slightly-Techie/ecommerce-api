# == Schema Information
#
# Table name: users
#
#  id                   :bigint           not null, primary key
#  active               :boolean          default(FALSE)
#  confirmation_token   :string
#  email                :string           not null
#  email_confirmed      :boolean          default(FALSE)
#  last_name            :string
#  other_names          :string
#  password_digest      :string           not null
#  password_reset_token :string
#  points               :decimal(, )      default(0.0)
#  username             :string           not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_password_reset_token  (password_reset_token) UNIQUE
#  index_users_on_username              (username) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :sessions, dependent: :destroy
  has_many :product_views, dependent: :destroy

  validates :username, :email, uniqueness: true, presence: true
  validates_with EmailAddress::ActiveRecordValidator, field: :email

  before_save :ensure_proper_case
  after_create :send_confirmation_email

  scope :active, -> { where(active: true) }
  enum account_type: { NON_TECHIE: 0, TECHIE: 1 }

  def token_expired?
    token_expiration_date&.past?
  end

  def confirm!
    update(email_confirmed: true, token_expiration_date: nil, active: true)
    send_welcome_email
  end

  def token
    session = sessions.create!(token: SecureRandom.hex(64), expiration_date: Time.now + 6.hours)
    session.token
  end

  # Mailer methods

  def send_confirmation_email
    update(confirmation_token: rand(000000..999999), token_expiration_date: Time.now + 1.hour)
    UserMailer.confirmation_mail(self).deliver_later
  end

  def send_password_reset_email
    update(password_reset_token: rand(000000..999999), token_expiration_date: Time.now + 1.hour) && sessions.destroy_all

    UserMailer.forgot_password_mail(self).deliver_later
  end

  def send_welcome_email
    UserMailer.welcome_mail(self).deliver_later
  end

  def ensure_proper_case
    self.email = email.downcase
    self.username = username.downcase
  end
end
