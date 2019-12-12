class User < ActiveRecord::Base
  has_secure_password

  validates :password, length: { minimum: 3 }, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true

  
  def self.authenticate_with_credentials(email, password)
    email = email.strip
    user = User.where("lower(email) = ?", email.downcase).first
    if (user && user.authenticate(password))
      return user
    end
    nil
  end

end
