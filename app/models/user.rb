class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  def self.authenticate(email, password)
    unless (user = self.find_by(email: email)).nil?
      if (user.password == password)
        return user
      end
    end
    nil
  end
end