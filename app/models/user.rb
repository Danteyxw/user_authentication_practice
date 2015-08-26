class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)
    unless (match = self.find_by(email: email)).nil?
      if (match.password == password)
        login = true
        user = match
      end
    else
      login = false
    end
    {login: login, user: user}
  end
end