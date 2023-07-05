class User < ApplicationRecord
  has_secure_password

  before_create do
    self.active = true
  end

  validates_uniqueness_of :email
  validates_uniqueness_of :username
  validates_presence_of :lastname


end
