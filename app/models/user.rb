class User < ActiveRecord::Base

  PASSWORD_REQUIREMENTS = /\A
    (?=.{5,})
  /x

  has_secure_password

  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, format: PASSWORD_REQUIREMENTS
  validates :password_confirmation, presence: true

end
