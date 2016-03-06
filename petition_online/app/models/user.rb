class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true
  has_many :petitions

  has_secure_password
end
