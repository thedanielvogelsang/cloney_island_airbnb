class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :phone_number, :email, presence: true
  validates :email, :phone_number, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create


  has_many :roles, through: :user_roles
  has_many :user_roles

  def full_name
    first_name + " " + last_name
  end

end
