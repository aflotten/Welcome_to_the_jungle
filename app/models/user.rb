class User < ApplicationRecord
  
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 4}
  before_save {email.downcase!}

  def self.authenticate_with_credentials(email, password)
    email.strip!
    email.downcase!
    @user = User.find_by_email(email)

    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end
end
