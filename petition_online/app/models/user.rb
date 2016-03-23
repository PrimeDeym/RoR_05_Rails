class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  
  has_many :petitions
  has_many :votes

  has_secure_password

  def name
    "#{first_name} #{last_name}"
  end
end
