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

  def self.authenticate_with_credentials(email, password)
    stripped_email = email.strip! || email
    puts stripped_email
    @user = User.where("LOWER(email) = ?", stripped_email.downcase).first
    if @user && @user.authenticate(password)
      return @user
    end
    nil
  end

end
