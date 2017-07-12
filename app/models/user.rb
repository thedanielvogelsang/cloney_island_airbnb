class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :phone_number, :email, :password_digest, presence: true
  validates :email, :phone_number, uniqueness: true

  has_many :roles, through: :user_roles
  has_many :user_roles
end
