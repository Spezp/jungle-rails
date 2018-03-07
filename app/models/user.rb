class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  validates :email, presence: true, :uniqueness => {:case_sensitive => false}
  validates :password, presence: true, length: { minimum: 3 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    @user_auth = User.find_by_email(email)
    puts @user_auth
    if @user_auth && @user_auth.authenticate(password)
      return @user_auth
    else
      return nil
    end
  end

end
